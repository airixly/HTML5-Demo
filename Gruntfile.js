module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        clean: {
            dev: ['dist'],
            build: {
                options: {
                    force: true
                },
                src: [process.env.HOME + '/Software/tomcat/webapps/air']
            }
        },
        coffee: {
            dev: {
                files: [
                    {
                        expand: true,
                        cwd: './js',
                        src: ['**/*.coffee'],
                        dest: 'dist/js',
                        ext: '.js'
                    }
                ]
            },
            prod: {
                files: [
                    {
                        expand: true,
                        cwd: './js',
                        src: ['**/*.coffee'],
                        dest: 'js/',
                        ext: '.js'
                    }
                ]
            }
        },
        less: {
            dev: {
                files: {
                    'dist/css/air.css': 'css/air.less'
                }
            },
            prod: {
                options: {
                    compress: true,
                    cleancss: true
                },
                files: {
                    'dist/css/air.min.css': 'css/air.less'
                }
            }
        },
        copy: {
            dev: {
                files: [
                    {
                        src: [
                            'js/**/*.html',
                            'css/img/**',
                            'vendor/requirejs/require.js',
                            'vendor/jquery/jquery.js',
                            'vendor/underscore-amd/underscore.js',
                            'vendor/backbone-amd/backbone.js',
                            'vendor/backbone.wreqr/lib/amd/backbone.wreqr.js',
                            'vendor/backbone.babysitter/lib/amd/backbone.babysitter.js',
                            'vendor/marionette/lib/core/amd/backbone.marionette.js',
                            'vendor/requirejs-text/text.js',
                            'vendor/bootstrap/dist/js/bootstrap.js'
                        ],
                        dest: 'dist/'
                    }
                ]
            },

            prod: {
                files: [
                    {
                        src: ['css/img/**'],
                        dest: 'dist/'
                    }
                ]
            },

            fonts: {
                files: [
                    {
                        expand: true,
                        cwd: 'css/font/',
                        src: ['fonts/**'],
                        dest: 'dist/'
                    }
                ]
            },

            build: {
                files: [
                    {
                        expand: true,
                        cwd: 'dist/',
                        src: '**',
                        dest: process.env.HOME + '/Software/tomcat/webapps/air/'
                    }
                ]
            }
        },
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
        preprocess: {
            dev: {
                options: {
                    context: {
                        DEBUG: true
                    }
                },
                src: 'index.html',
                dest: 'dist/index.html'
            },
            prod: {
                options: {
                    context: {
                        DEBUG: false
                    }
                },
                src: 'index.html',
                dest: 'dist/index.html'
            }
        }
    });
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-preprocess');

    //Production
    grunt.registerTask('pro', ['clean', 'coffee:prod', 'less:prod', 'preprocess:prod', 'requirejs', 'copy:prod',
        'copy:fonts', 'copy:build']);

    //Development
    grunt.registerTask('default', ['clean', 'coffee:dev', 'less:dev', 'preprocess:dev', 'copy:dev', 'copy:fonts', 'copy:build']);
};