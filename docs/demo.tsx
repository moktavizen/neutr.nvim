import React, { useState, useCallback, ReactNode, MouseEvent } from 'react';

export enum NetworkStatus {
  Idle = 'IDLE',
  Loading = 'LOADING',
  Success = 'SUCCESS',
  Error = 'ERROR',
}

export interface BaseEntity {
  readonly id: string | number;
  createdAt: Date;
  updatedAt?: Date;
}

export type AsyncState<T> = {
  data: T | null;
  status: NetworkStatus;
  error?: Error;
};

interface ListProps<T extends BaseEntity> {
  items: T[];
  renderItem: (item: T) => ReactNode;
  filterPredicate?: (item: T) => boolean;
  onItemSelect?: (id: T['id']) => void;
}

export const GenericList = <T extends BaseEntity>({
  items,
  renderItem,
  filterPredicate,
  onItemSelect,
}: ListProps<T>): React.JSX.Element => {
  const [selectedId, setSelectedId] = useState<T['id'] | null>(null);

  const handleItemClick = useCallback(
    (id: T['id']) => (event: MouseEvent<HTMLLIElement>) => {
      event.preventDefault();
      setSelectedId(id);
      onItemSelect?.(id);
    },
    [onItemSelect]
  );

  const filteredItems = filterPredicate ? items.filter(filterPredicate) : items;

  return (
    <div className="list-wrapper">
      <ul role="list" className="divide-y divide-gray-200">
        {filteredItems.map((item) => {
          const isSelected = selectedId === item.id;
          return (
            <li
              key={String(item.id)}
              onClick={handleItemClick(item.id)}
              className={`p-4 cursor-pointer transition-colors ${isSelected ? 'bg-blue-500 text-white' : 'hover:bg-gray-100'
                }`}
              data-status={NetworkStatus.Success}
            >
              {renderItem(item)}
            </li>
          );
        })}
      </ul>
    </div>
  );
};
