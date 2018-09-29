const gulp = require('gulp'),
    prefixer = require('gulp-autoprefixer'),
    uglify = require('gulp-uglify'),
    sass = require('gulp-sass'),
    include = require('gulp-include'),
    cleanCSS = require('gulp-clean-css'),
    rename = require('gulp-rename'),
    runSequence = require('run-sequence'),
    browserSync = require('browser-sync'),
    through = require('through2'),
    fs = require('fs'),
    path = require('path'),
    hash = require('gulp-hash');

const PATH = {
    DEV: __dirname,
    SRC: {
        JS: ['**/main.js', '!bitrix/**', '!lib', '!partials', '!node_modules/**'],
        STYLE: ['**/main.scss', '!bitrix/**', '!lib', '!partials', '!node_modules/**'],
    },
    WATCH: {
        JS: ['**/main.js', '!bitrix/**', '!node_modules/**'],
        STYLE: ['**/main.scss', '!bitrix/**', '!node_modules/**'],
        VENDORS: {
            JS: ['js/lib/**', 'js/partials/**'],
            STYLE: ['css/lib/**', 'css/partials/**'],
        }
    },
};

const JS_FILE_REGEXP_TEMPLATE = /main.min-?[a-z0-9]*.js/g;
const CSS_FILE_REGEXP_TEMPLATE = /main.min-?[a-z0-9]*.css/g;

const FILE_HASH_TEMPLATE = '<%= name %>.min-<%= hash %><%= ext %>';

const PHP_FILES = ['index.php', 'detail.php'];
const MAIN_JS_FILE = 'main.js';
const MAIN_STYLE_FILE = 'main.scss';

const FILE = {
    PHP: ['index.php', 'detail.php'],
    JS: 'main.js',
    STYLE: 'main.scss',
    PATH: {
        HEADER: '../../template/header-includes.php',
        FOOTER: '../../template/footer-includes.php',
    }
};

const CHANGE_EVENT = 'change';

function getPhpFiles(chunkPath, mainFolder, mainTemplate) {
    return chunkPath.includes(mainFolder)
        ? [path.resolve(chunkPath, mainTemplate)]
        : FILE.PHP.map(phpFile => path.resolve(chunkPath, '..', phpFile));
}

function changeTemplateFiles(phpFiles, fileName, template, withMessage) {
    phpFiles.forEach(phpFile => {
        if (fs.existsSync(phpFile)) {
            changeTemplateFile(phpFile, fileName, template);

            if (withMessage) console.log(`*** Изменен PHP файл: ${phpFile} ***`);
        }
    });
}

function changeTemplateFile(sourceFile, destFileName, template) {
    fs.readFile(sourceFile, 'utf8', (err, data) => {
        if (err) return console.log(err);

        const result = data.replace(template, destFileName);
        fs.writeFile(sourceFile, result, 'utf8', err => {
            if (err) return console.log(err);
        });
    });
}

function removeBuilds(folder, template) {
    fs.readdir(folder, (error, files) => {
        if (error) throw console.log(err);

        files
            .filter(name => template.test(name))
            .forEach(name => fs.unlinkSync(path.resolve(folder, name)));
    });
}

function buildJs(src, dest) {
    return gulp.src(src)
        .pipe(include())
            .on('error', console.log)
        .pipe(uglify())
        .pipe(hash({ template: FILE_HASH_TEMPLATE }))
        .pipe(through.obj((chunk, enc, cb) => {
            chunkPath = chunk.path.replace(/\\/g,"/");
            var jsFolder = path.resolve(chunkPath, '..');
            var jsFileName = path.basename(chunkPath);

            var phpFile = chunkPath.includes('/js/')
                ? path.resolve(chunkPath, '../../template/footer-includes.php')
                : path.resolve(chunkPath, '../index.php');

            removeBuilds(jsFolder, JS_FILE_REGEXP_TEMPLATE);
            changeTemplateFile(phpFile, jsFileName, JS_FILE_REGEXP_TEMPLATE);
            cb(null, chunk);
        }))
        .pipe(gulp.dest(dest))
        .pipe(browserSync.stream());
}

function buildCss(src, dest) {
    return gulp.src(src)
        .pipe(sass({ errLogToConsole: true }))
        .pipe(prefixer({
        	browsers: ['last 3 versions'],
        	cascade: false
        }))
        .pipe(cleanCSS())
        .pipe(hash({ template: FILE_HASH_TEMPLATE }))
        .pipe(through.obj((chunk, enc, cb) => {
            chunkPath = chunk.path.replace(/\\/g,"/");
            var cssFolder = path.resolve(chunkPath, '..');
            var cssFileName = path.basename(chunkPath);

            var phpFile = chunkPath.includes('/css/')
                ? path.resolve(chunkPath, '../../template/header-includes.php')
                : path.resolve(chunkPath, '../index.php');

            removeBuilds(cssFolder, CSS_FILE_REGEXP_TEMPLATE);
            changeTemplateFile(phpFile, cssFileName, CSS_FILE_REGEXP_TEMPLATE);
            cb(null, chunk);
        }))
        .pipe(gulp.dest(dest))
        .pipe(browserSync.stream());
}

gulp.task('js:build', () => buildJs(PATH.SRC.JS, PATH.DEV));

gulp.task('js:watch', () => gulp.watch(PATH.WATCH.JS).on(CHANGE_EVENT, file => {
    console.log(`*** Изменен JS файл: ${file.path} ***`);
    
    buildJs(file.path, path.resolve(file.path, '..'), true);
}));

gulp.task('css:build', () => buildCss(PATH.SRC.STYLE, PATH.DEV));

gulp.task('css:watch', () => gulp.watch(PATH.WATCH.STYLE).on(CHANGE_EVENT, file => {
    console.log(`*** Изменен CSS файл: ${file.path} ***`);

    buildCss(file.path, path.resolve(file.path, '..'), true);
}));

gulp.task('js:vendor:watch', () => gulp.watch(PATH.WATCH.VENDORS.JS).on(CHANGE_EVENT, file => {
    const filePath = path.resolve(file.path, '../..', FILE.JS);
    buildJs(filePath, path.resolve(filePath, '..'));
}));

gulp.task('css:vendor:watch', () => gulp.watch(PATH.WATCH.VENDORS.STYLE).on(CHANGE_EVENT, file => {
    const filePath = path.resolve(file.path, '../..', FILE.STYLE);
    buildCss(filePath, path.resolve(filePath, '..'));
}));

gulp.task('project:build', ['js:build', 'css:build']);

gulp.task('project:watch', ['js:watch', 'css:watch', 'css:vendor:watch', 'js:vendor:watch']);

gulp.task('project:run', () => runSequence('project:build', 'project:watch'));
