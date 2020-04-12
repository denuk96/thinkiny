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

window.FullCalendar = Calendar;
window.dayGridPlugin = dayGridPlugin;
window.interactionPlugin = interactionPlugin;
window.timeGridPlugin = timeGridPlugin;
window.listPlugin = listPlugin;
window.bootstrapPlugin = bootstrapPlugin;
window.timelinePlugin = timelinePlugin;