import * as React from "react";
import * as Oni from "oni-api";

export const activate = (oni: Oni.Plugin.Api) => {
    // Input bindings
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"));

    // Use fzf.vim since it's faster than Oni's finder
    oni.input.unbind("<c-p>");

    // C-t is 'find symbols' in Oni, but I want the 'go to definition'/'return' behavior provided
    // by Tsuquyomi.
    oni.input.unbind("<c-t>");

    oni.input.unbind("<c-tab>");

    // <s-f12> is "go to definition in split" by default,
    // in VSCode it's "find all references".
    oni.input.unbind("<s-f12>");
    oni.input.bind("<s-f12>", "language.findAllReferences");
};

export const deactivate = (oni: Oni.Plugin.Api) => {};

export const configuration = {
    "oni.useDefaultConfig": true,

    "ui.colorscheme": "summerfruit256",

    //"oni.bookmarks": ["~/Documents"],
    "oni.loadInitVim": true,
    "editor.fontFamily": "Inconsolata",
    "editor.fontSize": "20px",
    "editor.maximizeScreenOnStart": false,

    // UI customizations

    // autoClosingPairs interferes with typing too often.
    "autoClosingPairs.enabled": false,
    "commandline.mode": false,
    "oni.plugins.prettier": {
        enabled: true,
        settings: {
            semi: true,
            tabWidth: 4,
            useTabs: false,
            singleQuote: false,
            trailingComma: "none",
            bracketSpacing: true,
            jsxBracketSameLine: false,
            arrowParens: "avoid",
            printWidth: 120
        },
        formatOnSave: true
    },
    "sidebar.default.open": false,
    "statusbar.fontSize": "1.3em",
    "tabs.mode": "buffers",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto"
};
