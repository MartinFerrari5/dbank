import {dbank} from "../../declarations/dbank";
window.addEventListener("load", async ()=>{

   balance()
    
})


document.getElementById('form')
.addEventListener("submit", action)


async function action(e){
      e.preventDefault()
    const inputTopUp=document.querySelector("#topUp")
    const inputWithdraw=document.querySelector("#withdraw")
    const button =document.querySelector(".bankButton")
    button.setAttribute("disabled", true)

    await dbank.topUp(parseFloat(inputTopUp.value || 0))
    await dbank.withdraw(parseFloat(inputWithdraw.value || 0))
    
    balance()

    button.removeAttribute('disabled')
    inputTopUp.value=""
    inputWithdraw.value=""
}

async function balance(){
  const value= await dbank.checkBalance()
  document.querySelector(".balance").textContent=Math.round(value * 100)/100
 }
