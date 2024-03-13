addEventListener('fetch', event => {
  event.respondWith(
    Response.redirect('https://www.linkedin.com/in/brandonschreiber/', 301)
  );
});
