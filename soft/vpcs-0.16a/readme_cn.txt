
    ��ӭʹ�� VPCS, ���°汾Ϊ 0.16a.

    �������ֻ���ڸ���ѧϰ��δ��������ɣ���ֹ���ڸ�����ҵĿ�ģ����������շ�
����֯��ѧ�������Ҫ�ַ����������ַ�ȫ���ļ�����ֹ���ַַ���

    VPCS ����ģ����� 9 ������� PC������� ping/traceroute ��Щ PC������
����Щ PC �� ping/traceroute ������������·��������Ȼ��Щ����� PC������
��ȫ�����ϵ� PC����ֻ��һ�������� Linux �� Windows �ϵ�Ӧ�ó��򣬽�����
ʹ�����������й����������ڽ��� Dynamips ѧϰ Cisco �豸�Ĺ����У���
�𵽷ǳ���İ����������������ʵ���г䵱 PC ��·��������ʹ�� Vmware ����
�� PC��ͨ������Щ������߻�ռ�ô������ڴ�� CPU ��Դ��

   VPCS ���������� UDP ������̫ģʽ���� UDP ��ʽ�£�VPCS ͨ�� UDP ���ͺͽ�
�����ݰ�����̫��ʽ�£�ʹ�� /dev/tapx ���ͺͽ������ݰ����� Windows ��ֻ֧
�� UDP ��ʽ��

   �� VPCS ������ ȱʡ������ 20000 �� 20008 �� UDP �˿ڣ����� 30000 �� 
30008 �������ݰ������û��ָ�������ļ����ҵ�ǰĿ¼�´���ȱʡ�������ļ�
���ļ���Ϊ��startup.vpc����VPCS �ͻ��Զ����������ļ�����ִ�а��������
startup.vpc ���԰��������Ϊ VPCS ���ڲ����

   VPCS ��������ѡ��
   usage: vpcs [options]
           -u        udp mode, default
           -e        tap mode, using /dev/tapx
           -s port   local udp port, default from 20000
           -c port   remote udp port(dynamips udp ports), default from 30000
           -r file   run startup file

   ע�⣺VPCS ʹ�õ� cygwin1.dll �� cygwin.com ���е� cygwin1.dll ������
�ݣ����� Dynamips ʹ�õ� cygwin1.dll ���ݡ�������һϵͳ��ֻ�������°汾�ġ�

վ�㣺http://wiki.freecode.com.cn �� http://mirnshi.cublog.cn

��ʷ�汾��
   0.16a   ֧��IPv6
   0.15a   ����DHCP��ȡIP��ַ����
           ����������ַʱ�����Բ���ָ�����ص�ַ
   0.14g   �޶�traceroute����ѭ������
   0.14f   �޶�traceroute����TTL�������
   0.14e   �޶�echo��traceroute�����д������
   0.14d   �޶�Arp������󣬴���ؽ��㲥��ַ��ΪԴ��ַӦ��Arp����  
   0.14c   �޶�TTLΪ64  
   0.14b   �޶� I/O ���д���
   0.14a   ���� arp ���������ʾ��ǰ�� arp ��120��Ĺ���ˢ��
           ���� echo ���������Զ���������� udp/tcp ���ݰ�������ڲ���
           ACL �ǱȽ����õġ�
           �޶�ͬ�����Ƚϴ���
   0.13a   ���� ping/tracert ���� IP ��Ӧ
           �޶� ping �κ� IP�������ڴ���
   0.12s   �޶� tracert �����������
   0.10s   ֧�� udp ��ʽ
   0.02s   �޶���һ���ַ�����������
   0.01s   ��ʼ�汾
   