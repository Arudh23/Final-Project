public class CurrencyConverter {
    double[] exchangeRates={63,3,3,595,18,107,2};
    void printCurrencies() {
    System.out.println("rupee: " + currency[0]);
             System.out.println("dirham: " + currency[1]);
             System.out.println("real: " + currency[2]);
             System.out.println("chilean_peso: " + currency[3]);
             System.out.println("mexican_peso: " + currency[4]);
             System.out.println("_yen: " + currency[5]);
             System.out.println("$australian: " + $currency[6]);
    }
       
    public static void main(String[] args) {
         CurrencyConverter cc = new CurrencyConverter();
         cc.printCurrencies();
    }
    }