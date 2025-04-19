import { config, library, dom } from '@fortawesome/fontawesome-svg-core';

config.keepOriginalSource = false;

import { faCopy } from '@fortawesome/free-regular-svg-icons';
import { faCheck, faHeart } from '@fortawesome/free-solid-svg-icons';

library.add(faCheck, faCopy, faHeart);

dom.watch();
