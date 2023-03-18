import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="friendship-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatroomId: Number,
    currentUserId: Number
  }

  connect() {
    // console.log(this.currentUserIdValue)
    // console.log(`connecting to the ActionCable channel with id ${this.chatroomIdValue}`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "FriendshipChannel", id: this.chatroomIdValue },
      { received: (data) => { this.#insertMessage(data)}}
    )
  }

  disconnect() {
    // console.log("disconnecting")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessage(data) {
    // console.log(data)
    // console.log(this.currentUserIdValue === data.sender_id)
    const currUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currUserIsSender, data.message)

    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    // scroll to the bottom of the message list
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    // <div class="${ currentUserIsSender ? 'sender' : 'recipient'}">
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    // return currentUserIsSender ? "sender-style" : "receiver-style"
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

}
