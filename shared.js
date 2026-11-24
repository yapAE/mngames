// 透传分享码：线上部署需带 ?sharecode=xxx，本地 file:// 打开时无参数则不做任何处理
(function () {
  var q = location.search;
  if (!q || q.indexOf('sharecode') < 0) return;
  document.querySelectorAll('a[href]').forEach(function (a) {
    var h = a.getAttribute('href');
    if (h && h.indexOf('.html') >= 0 && h.indexOf('?') < 0) {
      a.setAttribute('href', h + q);
    }
  });
})();
