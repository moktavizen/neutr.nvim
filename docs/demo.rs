use std::collections::HashMap;
use std::fmt::{self, Display, Formatter};
use std::sync::{Arc, Mutex};

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum NetworkError {
    NotFound(String),
    Timeout { duration_ms: u64 },
    Unauthorized,
}

#[repr(C)]
pub struct CacheEntry<'a, T>
where
    T: Display + Send + Sync + 'a,
{
    pub key: &'a str,
    pub data: Arc<Mutex<Option<T>>>,
    pub ttl: u32,
}

impl<'a, T> CacheEntry<'a, T>
where
    T: Display + Send + Sync + 'a,
{
    pub const MAX_TTL: u32 = 86_400; // 24 hours

    pub fn new(key: &'a str, value: T) -> Self {
        Self {
            key,
            data: Arc::new(Mutex::new(Some(value))),
            ttl: Self::MAX_TTL,
        }
    }

    pub fn inspect(&self) -> Result<(), NetworkError> {
        let lock = self.data.lock().map_err(|_| NetworkError::Unauthorized)?;

        match *lock {
            Some(ref val) => {
                println!(r#"Key: "{}", Value: {}, Hex: {:#06x}"#, self.key, val, 0x2A);
                Ok(())
            }
            None => Err(NetworkError::NotFound(String::from(self.key))),
        }
    }
}

macro_rules! map_entry {
    ($key:expr => $val:expr) => {
        ($key.to_string(), $val)
    };
}

fn main() {
    let raw_payload = r#"{"theme": "cyberpunk", "active": true}"#;
    let multiplier = |x: i32| -> i32 { x * 2 };

    let mut map = HashMap::new();
    let (k, v) = map_entry!("token" => 42);
    map.insert(k, v);
}
