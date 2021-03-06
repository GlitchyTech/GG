#include <iostream>
#include <cmath>

/* ���� ��� �������������� ����� x � y. ���������, ����������� �� ����� � ������������ (x, y) ��������������� �������� (������� ��� �������).
���� ����� ����������� ��������, �������� ����� YES, ����� �������� ����� NO. �� ������� ����� ��������� � ����� 1.

���� - ���� � ��������� � ������ : (0, 1) , (0, -1) , (1, 0) , (-1, 0)

������� ������ ��������� ������� IsPointInSquare(x, y), ������������ True, ���� ����� ����������� �������� � False, ���� �� �����������.
�������� ��������� ������ ������� ���������� �����, ������� ������� IsPointInSquare � � ����������� �� ������������� �������� ������� �� ����� ����������� ���������.

������� IsPointInSquare �� ������ ��������� ���������� if.
������ ������� ������
�������� ��� �������������� �����.
������ �������� ������
�������� ����� �� ������.
Sample Input 1:
0
0
Sample Output 1:
YES
Sample Input 2:
1
1
Sample Output 2:
NO
*/

using namespace std;

bool IsPointInSquare(double x, double y){
    return abs(x) + abs(y) <= 1;
}

int main()
{
    double x, y;
    cin >> x >> y;
    if (IsPointInSquare(x, y) && x <= 1 && y <= 1){
        cout << "YES";
    }
    else {
        cout << "NO";
    }
    return 0;
}
