module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        requirejs: {
            compile: {
                options: {
                    baseUrl: 'js',
                    mainConfigFile: 'js/main.js',
                    name: 'main',
                    out: 'dist/air.min.js'
                }
            }
        },
        cssmin: {
            minify: {
                expand: true,
                cwd: 'css/',
                src: 'air.css',
                dest: 'dist/',
                ext: '.min.css'
            }
        },
        copy: {
            main: {
                files: [
                    {
                        expand: true,
                        cwd: 'css/',
                        src: ['font/**'],
                        dest: 'dist/'
                    },
                    {
                        src: 'bower_components/requirejs/require.js',
                        dest: 'dist/require.js'
                    },
                    {
                        expand: true,
                        cwd: './',
                        src: ['index.html', 'dist/**'],
                        dest: process.env.HOME + "/Software/tomcat/webapps/air/"
                    }
                ]
            },
            dev: {
                expand: true,
                cwd: "./",
                src: ['index.DEV.html', 'css/**', 'js/**', 'bower_components/**'],
                dest: process.env.HOME + "/Software/tomcat/webapps/air/"
            }

        }
    });
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-copy');

    grunt.registerTask('default', ['requirejs', 'cssmin', 'copy:main']);

    grunt.registerTask('dev', ['copy:dev']);
};