const Plugin = {
  id: "laser-pointer",

	init: function (reveal) {
    const { ...laserPointerConfig } = reveal.getConfig().laserPointer || {}
    const css = laserPointerConfig.css || {}
    const pointer = new Pointer({ document: document, css: css, active: false })
    reveal.addKeyBinding({
      keyCode: 20,
      key: "CAPSLOCK",
      description: "Toggle laser pointer",
    }, () => pointer.toggle())
	},
}

class Pointer {
  constructor({ document, css, active }) {
    this.active = active
    this.body = document.body
    this.element = document.createElement("div")

    Object.assign(this.element.style, {
      position: "absolute",
      float: "left",
      borderRadius: "100%",
      width: "2.5vh",
      height: "2.5vh",
      backgroundColor: "red",
      zIndex: 100,
      display: "none",
      ...css
    })
    this.body.appendChild(this.element)
  }

  move(event) {
    if (this.active) {
      this.body.style.cursor = "none"
      this.element.style.display = "block"
      this.element.style.left = event.pageX + "px"
      this.element.style.top = event.pageY + "px"
    } else {
      this.element.style.display = "none"
			this.body.style.cursor = "auto"
    }
  }

  toggle() {
    this.active = !this.active

    if (this.active) {
      document.addEventListener("mousemove", (event) => this.move(event))
    } else {
      document.removeEventListener("mousemove", (event) => this.move(event))
    }
  }
}

export default () => Plugin
