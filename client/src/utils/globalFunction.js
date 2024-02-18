

export const errHandler = (err) => {
  const errRes = err.response.data; 

  if (errRes.message === '다시로그인') {
    console.log("진입");
    
    alert(errRes.message);
    // navigate(errRes.url);
    window.location.replace(errRes.url)
  }
  return;
}
