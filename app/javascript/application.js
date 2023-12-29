// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import * as web_push from "noticed-web_push/web_push"
web_push.start({
  mounted_path: "/web_push",
  server_worker_path: "/service_worker.js"
})
