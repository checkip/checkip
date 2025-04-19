document.addEventListener('DOMContentLoaded', () => {
  const btn = document.querySelector('.ckp-button-clipboard');
  if (!btn) return;
  const icon = btn.querySelector('.ckp-icon-clipboard');
  if (!icon) return;

  btn.onclick = async () => {
    const target = document.getElementById(btn.dataset.clipboardTarget);
    if (!target) return;
    await navigator.clipboard.writeText(target.innerText);

    icon.innerHTML = '<i class="fa-solid fa-check"></i>';
    window.FontAwesome?.dom?.i2svg?.();

    setTimeout(() => {
      icon.innerHTML = '<i class="fa-regular fa-copy"></i>';
      window.FontAwesome?.dom?.i2svg?.();
    }, 5000);
  };
});
