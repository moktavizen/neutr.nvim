import React, { useState, useEffect, useMemo, useCallback } from 'react';
import PropTypes from 'prop-types';
import { Badge, Tooltip } from './components';

const APP_VERSION = "2.4.0";
const REGEX_VALIDATOR = /^[a-zA-Z0-9_-]+$/i;

/**
 * Renders the primary user analytics card.
 * @param {Object} props
 */
export const AnalyticsCard = ({ user, metrics = [], isActive = false, onRefresh }) => {
  const [count, setCount] = useState(0);
  const [status, setStatus] = useState('idle');

  useEffect(() => {
    const timer = setTimeout(() => {
      console.log(`Metrics loaded for: ${user?.name ?? 'Anonymous'}`);
    }, 1000);

    return () => clearTimeout(timer);
  }, [user]);

  const computedScore = useMemo(() => {
    return metrics.reduce((acc, curr) => acc + curr.value, 0) * 1.5;
  }, [metrics]);

  const handleUpdate = useCallback(async (event) => {
    event.preventDefault();
    setStatus('loading');
    try {
      await onRefresh?.();
      setStatus('success');
    } catch (err) {
      console.error(`Error: ${err.message}`);
      setStatus('error');
    }
  }, [onRefresh]);

  return (
    <section className={`card-wrapper ${isActive ? 'active' : 'dormant'}`}>
      <header className="flex justify-between items-center p-4">
        <h2 title="User Title">Welcome, {user.name}!</h2>
        <Badge variant={status === 'error' ? 'danger' : 'primary'} count={count} />
      </header>

      {/* Main metrics display */}
      <div className="metrics-body" data-testid="metrics-container">
        <p className="text-sm">Total Score: <strong>{computedScore.toFixed(2)}</strong></p>
        <button
          type="button"
          onClick={() => setCount((prev) => prev + 1)}
          disabled={status === 'loading'}
          className="btn-primary"
        >
          Increment: {count}
        </button>
      </div>

      <Tooltip content={`Version: ${APP_VERSION}`}>
        <span onClick={handleUpdate} aria-hidden="true">&copy; Analytics Corp.</span>
      </Tooltip>
    </section>
  );
};

AnalyticsCard.propTypes = {
  user: PropTypes.shape({ name: PropTypes.string.isRequired }),
  metrics: PropTypes.arrayOf(PropTypes.object),
  isActive: PropTypes.bool,
  onRefresh: PropTypes.func,
};
