import { MDCTopAppBar } from '@material/top-app-bar';
import { MDCRipple } from '@material/ripple';
import { MDCTooltip } from '@material/tooltip';

if (document.querySelector('.mdc-top-app-bar')) {
  const topAppBarElement = document.querySelector('.mdc-top-app-bar');
  MDCTopAppBar.attachTo(topAppBarElement);
}

if (document.querySelector('.mdc-icon-button')) {
  const iconBtnEls = Array.from(document.querySelectorAll('.mdc-icon-button'));
  iconBtnEls.forEach((el) => {
    const iconButtonRipple = new MDCRipple(el);
    iconButtonRipple.unbounded = true;
  });
}

if (document.querySelector('#api-link')) {
  const ghLink = document.getElementById('api-link');
  ghLink.addEventListener('click', () => {
    window.location.assign('/api');
  });
}

if (document.querySelector('#github-link')) {
  const ghLink = document.getElementById('github-link');
  ghLink.addEventListener('click', () => {
    window.location.assign('https://github.com/checkip/checkip');
  });
}

const tooltipEls = Array.from(document.querySelectorAll('.mdc-tooltip'));
tooltipEls.forEach((el) => {
  MDCTooltip.attachTo(el);
});
