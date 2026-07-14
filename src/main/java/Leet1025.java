import java.util.*;

public class Leet1025 {
    public boolean dGame(int n){
        boolean[] results = new boolean[n+1];
        for (int i = 0; i <= n; i++) {results[i] = true;}
        results[1] = false;
        for (int i = 2; i <= n; i++) {
            List<Integer> factors = getDivisors(i);
            boolean flag = false;
            for (int f : factors) {
                if (!results[i-f]) { results[i] = true; flag = true; break; }
            }
            results[i] = flag;
        }
        return results[n];
    }

    private Map<Integer, Boolean> results = new HashMap<>();
    public boolean divisorGame(int n) {
        results = new HashMap<>();
        results.put(1, false);
        return checkOne(n);
    }

    private boolean checkOne(int n) {
        List<Integer> factors = getDivisors(n);
        for (int f:  factors) {
            if (results.containsKey(n-f)) {
                boolean res = results.get(n-f);
                if (res) continue;
                else return true;
            } else {
                boolean res = checkOne(n-f);
                results.put(n-f, res);
                if (!res) return true;
            }
        }
        return false;
    }

    private List<Integer> getDivisors(int n) {
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= n/2; i++) {
            if (n % i == 0) {
                list.add(i);
            }
        }
        return list;
    }
}
