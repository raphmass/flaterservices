// BOOTSTRAP
import "bootstrap";

// MAPBOX
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
initMapbox()
initAutocomplete()
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// FLATPICKR
import flatpickr from "flatpickr";
// const flatpickr = require("flatpickr");
// var datepicker = document.querySelector(".datepicker")
// console.log(datepicker)
flatpickr(".datepicker")
