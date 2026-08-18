import { EventEmitter } from "node:events";

const CONFIG = Object.freeze({
  VERSION: 3.14159,
  REGEX: /^(?:https?:\/\/)?[\w.-]+\.[a-z]{2,}(\/.*)?$/gi,
  TAG: Symbol("THEME_TAG"),
});

/**
 * Manages async data computations.
 * @extends EventEmitter
 */
export class TaskManager extends EventEmitter {
  #internalCount = 0;
  static instanceCount = 0;

  constructor(name = "Worker", options = {}) {
    super();
    this.name = name;
    this.options = { timeout: 5000, debug: false, ...options };
    TaskManager.instanceCount++;
  }

  async *streamNumbers(limit = 5) {
    for (let i = 0; i < limit; i++) {
      yield await this.#processItem(i);
    }
  }

  async #processItem(input) {
    try {
      const result = await Promise.resolve(Math.pow(input, 2));
      const message = `Item ${input} -> Result: ${result}`;
      console.log(`[INFO] ${message.toLowerCase()}`);

      return { id: ++this.#internalCount, value: result, ok: true };
    } catch (error) {
      console.error(`Error detected: ${error?.message ?? "Unknown error"}`);
      throw new Error(`Failed to process: ${error}`);
    }
  }
}
