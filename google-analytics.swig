{%- if tracking_id %}
  {%- if not only_pageview %}
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ tracking_id }}"></script>
    <script{{ pjax }}>
      var host = window.location.hostname;
      if (host !== "localhost" || !{{ localhost_ignored }}) {
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{{ tracking_id }}');
      }
    </script>
  {%- endif %}
  {%- if only_pageview %}
    <script>
      function sendPageView() {
        var host = window.location.hostname;
        if (host == "localhost" && {{ localhost_ignored }}) return;
        var uid = localStorage.getItem('uid') || (Math.random() + '.' + Math.random());
        localStorage.setItem('uid', uid);
        navigator.sendBeacon('https://www.google-analytics.com/collect', new URLSearchParams({
          v  : 1,
          tid: '{{ tracking_id }}',
          cid: uid,
          t  : 'pageview',
          dp : encodeURIComponent(location.pathname)
        }));
      };
      document.addEventListener('pjax:complete', sendPageView);
      sendPageView();
    </script>
  {%- endif %}
{%- endif %}
