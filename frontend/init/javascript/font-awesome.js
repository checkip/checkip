import { config, library, dom } from '@fortawesome/fontawesome-svg-core';

config.keepOriginalSource = false;

import {
  faBars,
  faCode,
  faHeart,
  faHome,
  faSignal,
  faUserShield,
} from '@fortawesome/free-solid-svg-icons';

import { faGithub } from '@fortawesome/free-brands-svg-icons';

library.add(faBars, faCode, faHome, faHeart, faGithub, faSignal, faUserShield);

dom.watch();
