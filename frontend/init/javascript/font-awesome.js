import { config, library, dom } from '@fortawesome/fontawesome-svg-core';

config.keepOriginalSource = false;

import { faHeart } from '@fortawesome/free-solid-svg-icons';
import { faQuestionCircle } from '@fortawesome/free-solid-svg-icons';
import { faGithub } from '@fortawesome/free-brands-svg-icons';

library.add(faHeart, faQuestionCircle, faGithub);

dom.watch();
