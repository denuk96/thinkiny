// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("channels");
require("jquery");
require("packs/geocomplete");
require("packs/gmaps");
require("packs/fullcalendar.js");

import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application'
import './bootstrap_custom.js'


Notification.requestPermission().then(function (result) {})
