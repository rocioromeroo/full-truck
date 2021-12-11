// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
import React from "react";
import ReactDOM from "react-dom";
import  BrowserRouter  from "react-router-dom";
import "./index.css";
import App from "./App";
import * as serviceWorker from "./serviceWorker";

ReactDOM.render(
    <BrowserRouter>
        <App />
    </BrowserRouter>,
    document.getElementById("root")
);

serviceWorker.unregister();

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
