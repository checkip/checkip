import { MDCDataTable } from '@material/data-table';

const tableEls = Array.from(document.querySelectorAll('.mdc-data-table'));
tableEls.forEach((el) => {
  MDCDataTable.attachTo(el);
});
