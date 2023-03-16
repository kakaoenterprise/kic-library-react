const BASE_URL = "http://localhost:8080"
const OBJECT_STORAGE_URL = "https://objectstorage.kr-central-1.kakaoi.io/v1/9e8e800733b64edbb7cee30c61142df7/hands-on/kep-library"

export const API = {
    GET_ALL_BOOKS: `${BASE_URL}/api/v1.0/management/book/all`,
    GET_BOOK_DETAIL: `${BASE_URL}/api/v1.0/management/book`,
    FIND_BOOK_BY_NAME: `${BASE_URL}/api/v1.0/management/books`,
    FIND_BOOK_BY_CATEGORY: `${BASE_URL}/api/v1.0/management/book/category`,
}

export const URL = {
    BASE: `${BASE_URL}`,
    CDN: `${OBJECT_STORAGE_URL}`
}
