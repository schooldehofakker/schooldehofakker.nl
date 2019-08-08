const version = '20190808142229';
const cacheName = `static::${version}`;

const buildContentBlob = () => {
  return ["/2019/08/02/meester-hans-gaat-weer-naar-school-update/","/2019/07/14/meester-hans-gaat-weer-naar-school/","/2019/05/01/school-de-hofakker-op-radio-gelderland/","/2019/04/14/school-de-hofakker-onder-de-aandacht-in-tijdschrift-vrije-opvoedkunst/","/2019/04/11/open-dag-2019-de-hofakker-school/","/categorie%C3%ABn/","/contact/","/donaties/","/elements/","/nieuws/","/","/kracht-van-de-hofakker/","/leraren/","/manifest.json","/offline/","/assets/search.json","/assets/styles.css","/thanks/","/zoeken/","/redirects.json","/feed.xml","/sitemap.xml","/robots.txt","/assets/logos/logo.svg", "/assets/default-offline-image.png", "/assets/scripts/fetch.js"
  ]
}

const updateStaticCache = () => {
  return caches.open(cacheName).then(cache => {
    return cache.addAll(buildContentBlob());
  });
};

const clearOldCache = () => {
  return caches.keys().then(keys => {
    // Remove caches whose name is no longer valid.
    return Promise.all(
      keys
        .filter(key => {
          return key !== cacheName;
        })
        .map(key => {
          console.log(`Service Worker: removing cache ${key}`);
          return caches.delete(key);
        })
    );
  });
};

self.addEventListener("install", event => {
  event.waitUntil(
    updateStaticCache().then(() => {
      console.log(`Service Worker: cache updated to version: ${cacheName}`);
    })
  );
});

self.addEventListener("activate", event => {
  event.waitUntil(clearOldCache());
});

self.addEventListener("fetch", event => {
  let request = event.request;
  let url = new URL(request.url);

  // Only deal with requests from the same domain.
  if (url.origin !== location.origin) {
    return;
  }

  // Always fetch non-GET requests from the network.
  if (request.method !== "GET") {
    event.respondWith(fetch(request));
    return;
  }

  // Default url returned if page isn't cached
  let offlineAsset = "/offline/";

  if (request.url.match(/\.(jpe?g|png|gif|svg)$/)) {
    // If url requested is an image and isn't cached, return default offline image
    offlineAsset = "/assets/default-offline-image.png";
  }

  // For all urls request image from network, then fallback to cache, then fallback to offline page
  event.respondWith(
    fetch(request).catch(async () => {
      return (await caches.match(request)) || caches.match(offlineAsset);
    })
  );
  return;
});
