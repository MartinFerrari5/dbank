import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank{
    stable var startTime= Time.now();
      var currentValue : Float = 300 ; 
    // currentValue := 50;

    public func topUp(amount : Float){
      Debug.print(debug_show(amount));
      currentValue += amount;
       Debug.print(debug_show(currentValue));
    };

    public func withdraw (amount : Float){
       Debug.print(debug_show(amount));
      
      let res : Float = currentValue - amount;
       Debug.print(debug_show(res));
      if(res > 0 ){
         currentValue:=res;
        Debug.print(debug_show(currentValue));
      } else Debug.print("Negative value");
    }; 

    public query func checkBalance() : async Float{
        return currentValue;
    };
  
     public func compoundInterest (){
        let currentTime=Time.now();
        let timeElapsedNS= currentTime - startTime;
        let timeElapsedS= timeElapsedNS/(10**9);
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
        startTime := currentTime;
        Debug.print(debug_show(currentValue));
        
     };
}
//http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai&id=rrkah-fqaaa-aaaaa-aaaaq-cai



