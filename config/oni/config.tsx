import * as React from "react";
import * as Oni from "oni-api";

export const activate = (oni: Oni.Plugin.Api) => {
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"));

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // Use fzf.vim since it's faster than Oni's finder
    oni.input.unbind("<c-p>");
    // C-t is 'find symbols' in Oni, but I want the 'go to definition'/'return' behavior provided
    // by Tsuquyomi.
    oni.input.unbind("<c-t>");
    oni.input.unbind("<c-^>");
    oni.input.unbind("<c-tab>");

    oni.input.bind("<f24>", "language.findAllReferences");
    oni.input.bind("<f12>", "language.findAllReferences");
};

export const deactivate = (oni: Oni.Plugin.Api) => {};

export const configuration = {
    "oni.useDefaultConfig": true,

    "ui.colorscheme": "nord",

    //"oni.bookmarks": ["~/Documents"],
    "oni.loadInitVim": true,
    "editor.fontFamily": "Inconsolata",
    "editor.fontSize": "23px",
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
            trailingComma: "es5",
            bracketSpacing: true,
            jsxBracketSameLine: false,
            arrowParens: "avoid",
            printWidth: 120,
        },
        formatOnSave: true,
    },
    "sidebar.default.open": false,
    "statusbar.fontSize": "1.3em",
    "tabs.mode": "buffers",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
};
