import "./notfound.css"

export const NotFoundPage = () => {
    return (
        <><div className="notfound">
            <h1>Page Not Found</h1>
            <img alt="라이언" src={process.env.PUBLIC_URL + "/assets/ryan_img.png"}/>
            <br/>
            <a href="/"> [Home] </a>
        </div></>
    );
}