// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 13,

    // font family with optional fallbacks
    fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: false,

    // custom css to embed in the main window
    css: `
      .tab_tab {
        border: 1px solid #000;
        background: rgba(15, 17, 29, 0.7) !important;
      }

      .tab_textActive {
        border-bottom: 2px solid #009688;
      }

      .splitpane_divider {
        background-color: rgba(170, 187, 195, 0.16) !important;
      }
  	`,

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    backgroundColor: 'rgba(27, 29, 41, 0.7)',
    foregroundColor: '#eff0eb',
  	borderColor: '#222430',
  	cursorColor: '#97979b',
  	colors: {
  		black: '#282a36',
  		red: '#ff5c57',
  		green: '#5af78e',
  		yellow: '#f3f99d',
  		blue: '#57c7ff',
  		magenta: '#ff6ac1',
  		cyan: '#9aedfe',
  		white: '#f1f1f0',
  		lightBlack: '#686868',
  		lightRed: '#ff5c57',
  		lightGreen: '#5af78e',
  		lightYellow: '#f3f99d',
  		lightBlue: '#57c7ff',
  		lightMagenta: '#ff6ac1',
  		lightCyan: '#9aedfe',
  		lightWhite: '#eff0eb'
  	},

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    // make sure to use a full path if the binary name doesn't work
    // (e.g `C:\\Windows\\System32\\bash.exe` instead of just `bash.exe`)
    // if you're using powershell, make sure to remove the `--login` below
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    summonShortcut: 'Alt+Space'
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hypercwd',
    'hyperlinks',
    'hyperminimal',
    'hyperterm-alternatescroll',
    'hyperterm-summon',
    'hyperterm-tabs',
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
