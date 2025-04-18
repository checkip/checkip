// import { MDCTopAppBar } from '@material/top-app-bar';
// import { MDCDrawer } from '@material/drawer';
// import { MDCRipple } from '@material/ripple';

// if (document.querySelector('.mdc-top-app-bar')) {
//   const topAppBarElement = document.querySelector('.mdc-top-app-bar');
//   MDCTopAppBar.attachTo(topAppBarElement);

//   if (document.querySelector('.mdc-drawer')) {
//     const drawer = MDCDrawer.attachTo(document.querySelector('.mdc-drawer'));
//     const topBar = MDCTopAppBar.attachTo(document.querySelector('.mdc-top-app-bar'));
//     const drawerListEl = document.querySelector('.mdc-drawer .mdc-deprecated-list');
//     const mainContentEl = document.querySelector('.ckp-layout-fixed');

//     topBar.listen('MDCTopAppBar:nav', () => {
//       drawer.open = true;
//     });

//     drawerListEl.addEventListener('click', () => {
//       drawer.open = false;
//     });

//     document.body.addEventListener('MDCDrawer:closed', () => {
//       if (mainContentEl.querySelector('input, button')) {
//         mainContentEl.querySelector('input, button').focus();
//       }
//     });
//   }
// }

// if (document.querySelector('.mdc-icon-button')) {
//   const iconBtnEls = Array.from(document.querySelectorAll('.mdc-icon-button'));
//   iconBtnEls.forEach((el) => {
//     const iconButtonRipple = new MDCRipple(el);
//     iconButtonRipple.unbounded = true;
//   });
// }
