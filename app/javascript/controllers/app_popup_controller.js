import { Controller } from "@hotwired/stimulus"

const STORAGE_KEY = "jae_app_popup_dismissed_at"
const DISMISS_DAYS = 7
const DELAY_MS = 5000

export default class extends Controller {
  static targets = ["close"]

  connect() {
    if (!this.isPhoneBrowser() || this.recentlyDismissed()) return
    this.timer = setTimeout(() => this.open(), DELAY_MS)
  }

  disconnect() {
    clearTimeout(this.timer)
    this.unlock()
  }

  open() {
    this.element.hidden = false
    document.body.classList.add("app-popup-open")
    document.addEventListener("keydown", this.onKeydown)
    this.closeTarget.focus()
  }

  dismiss() {
    this.element.hidden = true
    this.unlock()
    try {
      localStorage.setItem(STORAGE_KEY, Date.now().toString())
    } catch (e) {}
  }

  // Click on the blurred area (not on the card) closes it
  backdropClick(event) {
    if (event.target === this.element) this.dismiss()
  }

  onKeydown = (event) => {
    if (event.key === "Escape") this.dismiss()
  }

  unlock() {
    document.body.classList.remove("app-popup-open")
    document.removeEventListener("keydown", this.onKeydown)
  }

  // true only for phones in a regular browser (not desktop, not inside the app)
  isPhoneBrowser() {
    const ua = navigator.userAgent

    // Identifier the app team should add to the WebView's user agent
    if (/JaEApp/i.test(ua)) return false

    // Fallbacks until the identifier exists
    if (/Android/i.test(ua)) return !/; wv\)/.test(ua)
    if (/iPhone|iPod/i.test(ua)) return /Safari/i.test(ua)

    return false
  }

  recentlyDismissed() {
    try {
      const at = parseInt(localStorage.getItem(STORAGE_KEY), 10)
      return at && Date.now() - at < DISMISS_DAYS * 24 * 60 * 60 * 1000
    } catch (e) {
      return false
    }
  }
}
