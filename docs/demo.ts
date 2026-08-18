import type { ComponentProps } from "react";

export enum Status {
  Idle = "IDLE",
  Pending = "PENDING",
  Success = "SUCCESS",
  Error = "ERROR",
}

export type Nullable<T> = T | null | undefined;
export type UserRole = "admin" | "editor" | "viewer";

export interface Identifiable {
  readonly id: string | number;
}

export interface User<TMeta = Record<string, unknown>> extends Identifiable {
  username: string;
  role: UserRole;
  metadata?: TMeta;
  status: Status;
}

function LogMethod(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
  // Decorator implementation
}

export class Repository<T extends Identifiable> {
  private storage: Map<T["id"], T> = new Map();

  public async find<K extends keyof T>(id: T["id"], property?: K): Promise<Nullable<T[K] | T>> {
    const record = this.storage.get(id);
    if (!record) return null;
    return property ? record[property] : record;
  }

  @LogMethod
  public persist(entity: T): boolean {
    if (typeof entity.id === "string" && entity.id.trim() === "") {
      throw new TypeError("Entity ID is missing!");
    }
    this.storage.set(entity.id, entity);
    return true;
  }
}
