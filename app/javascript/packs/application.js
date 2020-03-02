import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initUpdateHomeNavbarOnScroll } from '../components/navbar-home';
initUpdateNavbarOnScroll();
initUpdateHomeNavbarOnScroll();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
