import { Route, Routes } from "react-router-dom";
import { MainPage } from "./Page/MainPage/MainPage";
import { DetailPage } from "./Page/DetailPage/DetailPage";
import { NotFoundPage } from "./Page/NotFoundPage/NotFoundPage";
import { SearchPage } from "./Page/SearchPage/SearchPage";

export const App = () => {
  return (
   <Routes>
    <Route
      path=''
      element={<MainPage />}
    />
    <Route
      path="/detail/:bookId"
      element={<DetailPage />}
    />
    <Route
      path="/result/:type/:keyword"
      element={<SearchPage />}
    />
    <Route
      path="/*"
      element={<NotFoundPage />}
    />
   </Routes>
  );
}