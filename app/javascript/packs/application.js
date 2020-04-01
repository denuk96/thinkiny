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

import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application'
import './bootstrap_custom.js'


// calendar goes here

// import * as Calendar from "./fullcalendar/core/main";
// import  dayGridPlugin from "./fullcalendar/daygrid/main";
// import interactionPlugin from "./fullcalendar/interaction/main";
// import timeGridPlugin from "./fullcalendar/timegrid/main";
// import listPlugin from './fullcalendar/list/main';

import * as Calendar from "@fullcalendar/core";
import  dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import timeGridPlugin from "@fullcalendar/timegrid";
import listPlugin from '@fullcalendar/list';
import bootstrapPlugin from '@fullcalendar/bootstrap';
import timelinePlugin from '@fullcalendar/timeline';




import '@fullcalendar/core/main.css';
import "@fullcalendar/core/main.css";
import "@fullcalendar/daygrid/main.css";
import "@fullcalendar/timegrid/main.css";
import '@fullcalendar/list/main.css';
import '@fullcalendar/timeline/main.css';

// import "./fullcalendar/core/main.css";
// import "./fullcalendar/daygrid/main.css";
// import "./fullcalendar/timegrid/main.css";
// import './fullcalendar/list/main.css';

window.FullCalendar = Calendar;
window.dayGridPlugin = dayGridPlugin;
window.interactionPlugin = interactionPlugin;
window.timeGridPlugin = timeGridPlugin;
window.listPlugin = listPlugin;
window.bootstrapPlugin = bootstrapPlugin;
window.timelinePlugin = timelinePlugin;

// calendar ends here

Notification.requestPermission().then(function (result) {})
