use std::path::PathBuf;

use openvb::Singer;

pub fn read_encoded(path: String) -> Option<String> {
    let path = PathBuf::from(path);
    let data = Singer::load(&path);

    match data {
        Ok(singer) => {
            let encoded = serde_json::to_string(&singer);

            if let Err(e) = encoded {
                eprintln!("Error encoding singer: {}", e);
                return None;
            }

            Some(encoded.unwrap())
        }
        _ => None
    }
}

pub fn write_encoded(path: String, data: String) -> bool {
    let path = PathBuf::from(path);
    let decoded: Result<Singer, _> = serde_json::from_str(&data);

    match decoded {
        Ok(singer) => {
            if let Err(e) = singer.save(&path) {
                eprintln!("Error saving singer: {}", e);
                return false;
            }

            true
        }
        _ => false
    }
}