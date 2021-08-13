import { config, library, dom } from '@fortawesome/fontawesome-svg-core';

config.keepOriginalSource = false;

import { faCode } from '@fortawesome/free-solid-svg-icons';
import { faGithub } from '@fortawesome/free-brands-svg-icons';
import { faHeart } from '@fortawesome/free-solid-svg-icons';

library.add(faCode, faHeart, faGithub);

dom.watch();
