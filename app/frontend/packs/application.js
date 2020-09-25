require("@rails/ujs").start()
require("./maps");
require("./lightbox.min");
import 'bootstrap/dist/js/bootstrap'

import '../stylesheets/application.scss'

const images = require.context('../images', true)

import "@fortawesome/fontawesome-free/js/all";
