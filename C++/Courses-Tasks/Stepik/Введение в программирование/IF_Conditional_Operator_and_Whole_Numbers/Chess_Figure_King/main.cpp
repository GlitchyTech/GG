#include <iostream>

using namespace std;

/*��������� ������ ����� �� �����������, ��������� � ���������, �� ������ �� 1 ������. ���� ��� ��������� ������ ��������� �����, ����������, ����� �� ������ ������� � ������ ������ �� ������ ����� �����.
������ ������� ������
��������� �������� �� ���� ������ ����� �� 1 �� 8 ������, �������� ����� ������� � ����� ������ ������� ��� ������ ������, ����� ��� ������ ������.
������ �������� ������
��������� ������ ������� YES, ���� �� ������ ������ ����� ������ ����� ������� �� ������ ��� NO � ��������� ������.
Sample Input:
4
4
5
5
Sample Output:
YES
*/

int main()
{
    int x,y,x1,y1;
    cin >> x >> y >> x1 >> y1;
    if ((x-1==x1 && y-1==y1) || (x-1==x1 && y+1==y1) || (x+1==x1 && y-1==y1) || (x+1==x1 && y+1==y1) || x-1==x1 || y-1==y1 || x+1==x1 || y+1==y1 || (x==x1 && y==y1) )
    {
        cout <<"YES"<< endl;
    }
    else
    {
        cout <<"NO"<< endl;
    }
    return 0;
}
