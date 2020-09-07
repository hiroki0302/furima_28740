const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById('charge_form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    

    const formResult = document.getElementById('charge_form');
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_purchase[number]"),
      cvc: formData.get("user_purchase[cvc]"),
      exp_month: formData.get("user_purchase[exp_month]"),
      exp_year: `20${formData.get("user_purchase[exp_year]")}`,
    };
    alert(formData.get("user_purchase[number]"))
    alert(formData.get("user_purchase[cvc]"))
    alert(formData.get("user_purchase[exp_month]"))
    alert(`20${formData.get("user_purchase[exp_year]")}`)

    Payjp.createToken(card, (status, response) => {
      alert("ok")
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge_form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge_form").submit();
        document.getElementById("charge_form").reset();
      } else {
        document.getElementById("charge_form").submit();
        document.getElementById("charge_form").reset();
      }
    });
  });
};

window.addEventListener("turbolinks:load", pay);