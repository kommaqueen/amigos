import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="friendship-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatroomId: Number
  }

  connect() {
    console.log(`connecting to the ActionCable channel with id ${this.chatroomIdValue}`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "FriendshipChannel", id: this.chatroomIdValue },
      { received: (data) => { this.#insertMessage(data)}}
    )
  }

  disconnect() {
    console.log("disconnecting")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // scroll to the bottom of the message list
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

}
