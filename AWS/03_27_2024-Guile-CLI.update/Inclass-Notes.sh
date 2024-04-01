# AWS CLI
# Guile - 03_27_2024

# References
# https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
# https://awscli.amazonaws.com/v2/documentation/api/latest/index.html
# https://docs.aws.amazon.com/linux/al2023/ug/get-started.html
# https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters-ami.html
# https://aws.amazon.com/blogs/compute/query-for-the-latest-amazon-linux-ami-ids-using-aws-systems-manager-parameter-store/



# Installation

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# Win:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# Mac:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# https://graspingtech.com/install-and-configure-aws-cli/


# Linux:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip  #install "unzip" if not installed
sudo ./aws/install
  
cli bir servis degil bir arayuzdur . konsola gitmeden terminalden islem yapmamiza olanak taniyan bir arayuz
 ana amac otomasyondur
 aws s3 ls ile backet larimizi listelemeye calisalim. 
 eger daha once configution islemi yapmadiysak  bu listeöeme islemi gerceklesmeyecek 
 cunku daha bizim kim oldugumuzu bu islmi yapmaya yetkili olup olmadigimizi bilmiyor 

 instegram orneginde oldugu gibi , app'i indirmek islem yapmak icinn yeterli olmaz ayni zamanda uyelik isleminide gerceklestirmek lazim.
 yani configure islmi yapilmalidir  



# Configuration
 aws --version   --->>>> ile kurulup kurulmadigini ve versionu  kontrol edelim.

aws configure  --->>>> git  bash'e bu komutu yazalim.
------>> eger  daha once  konfigire etmemis olsaydik  ASAGIDAKI  ifade ila karsilasaxcaktik . 
--->>>    ;
    >>> AWS Access KEY id  [none] >> enter 
    >>> aws secret access key[none] >> enter 
    >>> default region name [none] >> enter
    >>> default  output format [none]>> enter


    --->>> konfigure ettigimiz icin 
     >>> AWS Access KEY id  [**********] >> enter 
    >>> aws secret access key[*********] >> enter 
    >>> default region name [us-east-1] >> enter
    >>> default  output format [table]>> enter  yaziyor olacak .


---->>> simdi konsola gidelim ve gerekli ayarlari yapalim.
    >>> sag ustte ismimizin oldugu yere gelelim .
    >>> acilan sekmede SECURITY CREDENTIAL'i  secelim . bu bir kisa yoldur ve bizi IAM servisine goturur.
    >>>  simdim IAM servisindeki kendi userimin credentials larini goruyoruz
    --->>> sayfada asagi inip ACCESS KEYS  bölümüne gelelim
       >>> bunlar programatik access icin kullanilan keylerdir 
       >>> basligin altinda cli powershell vsr gorebiliriz 
       >>> kullanilan key hakkinda bilgi verir
       >>>  --->> CREAT ACCESS KEY -->> Aayni anda sadece iki keye sayhip olabiliriz
       >>>   en ustteki commend line interface (cli) secelim 
       >>>  en alttan confirm edip next diyelim .
       >>> bir isim isteyecek yazmasakta olusturu cok onemli degil istersek yazabiliriz ve cread access key diyebiliriz
       >>>
       ------->>> artik acilan sayfada access key ve secret access keyi gorebiliriz 
              >>>  önemli bu keyler konsola giris yaptigimiz sifre ve kullanici adi ile nerdeyse ay seylerdir mutlaka cok gizli tutulmalidir
              >>> bu keylere sahip birisi kendi terminalindan  bu keyleri kullanarak bizim hesabimiza ulasabilir 
              >>> ister download edin yada kopyalayip terminale yapistirin .
              >>> ucretli degil kolaylikla silinebilir degistirilebilir .
              ------
              ------>>>>>   simdi access key ve secret key i kopyalayip terminalde yerine yazalim
              
                         >>> AWS Access KEY id  [none] >> ----->  access key  > enter 
                         >>> aws secret access key[none] >>-----> secret key  > enter 
                         >>> default region name [none] >>  ----> us-east-1   > enter ---->  region seciyoruz islemler secilen regiona gote yapilacak 
                         >>> default  output format [none] >> ---> table      > enter yaml ,json table hepsi yazilabilir ama table biraz daha kullanisli 

                         -->> her sey dogru yapildiysa islem tamalanmis demektir 

                           --> access key sayfasi done edilebilir artik 
                                 -->> keyler kullanilmiyorsa silinebilir ve deaktive edilebilir .
                                   >> eski keyler birdaha kullanilamaz .
                                   >> yeni keyler ile konsolumuzu yeniden configure edebiliriz veya var olanlari update edilebilir 
 
            

-->> cat .aws/ config dedigimizde aws bu dsoyalari  otomotik olusturdu
cat .aws/credentials  -->> aws config dedigimizde aws bu dsoyalari  otomotik olusturdu
      >>  komutlari ile serverde olusan config ve credendials dosyalarinin icini gorelim 
      >>>  eger baskasinin serverinda islem yapiliyorsa islem bitirilip cikilirken bu dosyalarda silinmelidir . (1,18 dk

      >>>>>> ihtiyac halinda bu bilgiler guncellenip kullanilabilir .

     PEKI CONFIGURATION DOGRU CALISIYYORMU 
          aws s3 ls   ile backet lar yada aws iam list-users ile kullanicilar listelenebilir  ve konfigurasyonun dogru calistigindan emin olabiliriz
          video saat 1.13 te 

---->>>>>
    
    -->>> eger kisim farkli farkli sirketlerde veya sirketin farkli bolumllerinde  calisiyorsa farkli profillere ihtiyac duyabilir .
    her profili herzaman bastan olusturmak zorunda degiliz . 

aws configure --profile user1 -->> komutu ile yeni bir profil olusturuyoruz 
     -->> artik farkli kredentienler kullanan farkli profillerim var .
     aws s3 ls -- profile user1     -->  dersem  s3 backetlarimi listeler 
                                    -->> ama her seferinde bu useri kullanmak icin ayrica user nameyi komutlarin sonuna eklememmek 
                                    icin siradaki komut ile birkerelik  export edebiliriz .


export AWS_PROFILE=user1  --->> bu komut calistirildiginda artik o gunluk calistirilan komutlar hep bu userda calistirilir
export AWS_PROFILE=default  --->> tekrar default profile donmek icin bu komut kullanilir 

aws configure list-profiles   --->>> bu komut ile farkli profillerimizi gorebiliriz.

   --->>>linux ve mac icin .aws/credentials  dosya dizini ,-->> windovs icin ise   c:\users\USERNAME\.aws\credentials  dosya   dizininde 

aws sts get-caller-identity    --->>> bu komut ile kim oldugunmuzu nereye  gitmek ulasmak istedigimizide goruyoruz
          
          video saat 1,30 dan itibaren 
    ------>>>>> simdi bu kurulumu bir sanal makinaya yapalim...<<<<<<------
          --->> once bir ec2 ayaga kaldiralim. 
                 -->> isim polat-cli
          >>>>> bunu yaparken bir linx makina yerine ubuntu bir makina secelim. 
          >>>>> neden ubuntu makina , cunku  aws linux 2023  makinalara cli kurulu geliyor .
            >>>>> diger ayarlar klasik sekilde yapilir ...

            ---->> sanal makinaya baglanalim.. ubuntu makina oldugunu unutmayalim..
            >>>>>>  connect kismindan  linki alalim ve baglanalim ...


 ----->>> kurulum icin ihtiyacimiz olan linkler ve komutlar yukaridada var  

      -->>  aws --version    ile once kurulu olup olmadigini kontrol edelim
      -->>  aws not foun gibi bitsey cikacak , bu kurulu olmadigi anlamina gelir ve bir iki komut onerebilir .
      -->> bir cli2 yi kurmak istiyoruz 

             1. adim   olarak bu komutu calistiralim-->>     
             
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

             2. adim olarak ll ile dosyalari  ve awscliv2.zip" dosyasini  gorelim.
                  aws dosyasi olusmadi henuz o configure ettikten sonra olusacak
             3. adim olarak -->> 
             
              unzip awscliv2.zip   
              
               -->> bu komut ile bu dosyayi acalim yani unzip yapacak 
                  -->> unzip bulunamadi ama calistirabilirsinn diyecektir 
             4. adim      -->>  

              sudo apt install unzip  
              
               -->  komutu ile calistiralim  ve unzip in yuklemesini yapalim
             5. adim    tekrar    --->>>  
             
              unzip awscliv2.zip   
              
               -->> komutu calistirilir  ve unzip yaptigi gorulur .
                -->> simdi ll yapilirsa aws dosyasi gorulebilir 
             6. adim aws dosyasi icindeki install i calistirmak -->>  
             
               sudo ./aws/install      

                        komutu ile aws dosyasi calistirilir .

                        artik aws --version ile kontrol edebiliriz . kurulumumuz gerceklesti .

            peki bu yeterlimi ??
            hangi accont veya hangi credentials a gidecek bunlarin  konfigure edilmesi gerekir 

            -->>  aws configure 

              her seferinde yeni key olusturmak zorundamiyiz ??   hayir mevcut keyleri kullanabiliriz.  
                         >>>  AWS Access KEY id  [none] >> ----->  access key  > enter 
                         >>> aws Secret access key[none] >>-----> secret key  > enter 
                         >>> default region name [none] >>  ----> us-east-1   > enter ---->  region seciyoruz islemler secilen regiona gote yapilacak 
                         >>> default  output format [none

                               tekrar ayni seyleri yapmamak icin bu kismi atlayabiliriz . 
                               bu adimlari takip ederek bir linux makinayada cli kurulumu yapmis olduk.


                               Uyari =  uzaktaki bir makinaya bu credentials lar ile baglanmak cok mantukli ve guvenli degildir
                                biz isimizi bitirip ciksak bile bu aws dosyasi o makinda kalmaya devam eder .
                                ve o makinayi kullananlar  bu dosyaya ulasabilir . bu credentilas lari  buraya girmeden  aws servislerine ulasabilirmiyim .
                                evet ulasabilirim ec2 ayaga kalkarken atayacagimiz roller ile bu islemi guvenli sekilde yapariz . 
                                bu role kavramini AIM  dersinde gormustuk .

                                simdi sanal makina ile isimiz kalmadi artik lokalden devam edebiliriz . vodeo  1.50 de 
                                instanceyi cli komutlari ile birazdan terminated edebiliriz


      ---->>>> neler ogrendik   

            -->> kurlum , konfigurasyon , remote bir servera kurmayi ogrendik ,nhatta rollerle bu islemi kredentilas kullanmadan yapilabildigini ögrendik 
   

------->>>>>>  ARTIK BIRAZ KOMUTLARI TANIYALIM >>>> 
  
         -->>>   bu link ile dokumantasyona gidilebilir .  https://awscli.amazonaws.com/v2/documentation/api/latest/index.html
          ve nerde  hangi komut kullanilir bakilabilir 

          yada dah kolay bir kullanim ve ulasim sekli var .

          -->>>  aws help  
          
          komutu ile 

          bir servisin komutlari hakkinda bilgi almak istiyorsam  

           --->>> aws servis adi help   örnek olarak   -->>   aws s3 help    <<---    gibi 

           baska bir kullanim sekli   -->>> aws s3 ls help  <<<-----


           özet olarak help ile bircok bilgiye ulasiyoruz 

# IAM
aws iam list-users  --->>  kullanicilari listeler 
aws iam list-groups --->> gruplari listeler 

aws iam create-user --user-name aws-cli-user  --->> yeni bir user olusturur 
       
       aws iam list-users   ile tekrar baktigimda cli-user  olustugunu gorebiliriz 

       bu olusturulan user  asagidaki komut ile silinedebilir 

aws iam delete-user --user-name aws-cli-user
       
       aws iam list-users   ile tekrar baktigimda cli-user in silindigini gorebiliriz.

# S3
aws s3 ls   -->> backed'larimizi listeler 

aws s3 mb s3://guile-cli-bucket  -->> backed olusturma komutu  

        -->> aws s3 mb s3://   -->> bu kismi komut   -->>guile-cli-bucket  bu kismi bizim verdigimiz isim .
        -->> eger isim daha once verilmis ise  biz bu ismi alamayiz , dolayisi ile yeni bir isimde almaliyiz 

        -->> aws s3 ls  -->> ile olusup olusmadigini kontrol edebilirim  


aws s3 cp in-class.yaml s3://guile-cli-bucket  -->> bu komut ile  bucked'in icine dosya atabilirim 
     
     -->> aws s3 cp - alinacak dosya adi - dosyanin kopyalanacagi yer .
      -->> ll ile var olan dosyalari goruntule ve birini olusturdugumuz buckedin icine atalim
      -->> relativ yada absoluet ped kullanilabilir 

aws s3 ls s3://guile-cli-bucket   -->>> bu komutumuz ilede buckedimizim icindeki objeler listelenir 

aws s3 rm s3://guile-cli-bucket/in-class.yaml  -->> attigimiz bir objeyi yada varolan bir objeyi sileriz .
  bos olan bucked de silinebilir   

  -->> aws s3 rb s3://guile-cli-bucket

      eger bucked bos degilse   

      -->>aws s3 rm s3://guile-cli-bucket --force   ile ici dolu buckedde silinebilir 


                

                 aslinda biz bu komutlari daha once iam dersinde rol olusturuken kullandik. 
                

                 #!/bin/bash

                  yum update -y
                  yum install -y httpd
                  cd /var/www/html
                  aws s3 cp s3://osvaldo-pipeline-production/index.html . -->bucked in icindeki html dosyasinin kopyasini ec2 icine kopyaladik .
                  aws s3 cp s3://osvaldo-pipeline-production/cat.jpg .
                  systemctl enable httpd
                  systemctl start httpd   (ima reedme dosyasinda alindi)



          ----->>>>    simdi ec2 komutlarina gecebiliriz   <<<<-----

# EC2 
aws ec2 describe-instances  -->> instancelerimizi listeler  ve ayrintili bilgileri verir hemen herseyi yazar 

            aws ec2 describe-instances --region  us-west-1  -->> ile farkli regiondaki ec2 larda listelenebilir .  


--->>> buradaki komut satiri ile komutlar ile bir ec2 ayaga kaldirabiliriz . 
   >>> dokumantasyona bakildiginda daha baska bircok ozellik  ve bu ozelliklerin nasil eklenebildigi gorulecektir  
   >>> alttaki 5 satirlik kod blogu beraber yazilir key name kismina herkes kendi key nameini yazmali  

aws ec2 run-instances \
   --image-id ami-0b5eea76982371e91 \
   --count 1 \
   --instance-type t2.micro \
   --key-name bera                # put your key name 

   --->> yazilmayan ozellikleri default olanlarini alir . 


   ----->>> eger cokfazla ec2 varsa biz kendi ec2larimizi nasil listeleriz ?????


aws ec2 describe-instances \  
   --filters "Name = key-name, Values = KEY_NAME_HERE" # put your key name  -->> bu kod ile ec2lar  filtrelenir ve listelenir keyname dikkat 

   aws ec2 describe-instances \  
   --filters "Name = key-name, Values = bera"   -->>> herkes kendi key name ni kullanacak

   --->>> filtreler bizim istedigimiz name value seklindeki ozellikleri filtreler 



------>>> ec2nun bir cok ozwelligi var ve genel bir filtrelemede tum bu ozellikler kalabalik bir tablo seklinde gelir .
      >>> ama bir sadece istedigimiz bilgileri gorecek sekildede    --->>  query  <<<---  ile filtreleme yapabiliriz .

      >>>  ornek olarak asagidaki kod calistirildiginda bize sadece publicip adreslerini verecek 

aws ec2 describe-instances --query "Reservations[].Instances[].PublicIpAddress[]"  


----- uyari --- komut formatlari icin dökumnatasyona mutlaka bakilmali , farkli islemler icin farkli formatlar mevcut  





----
----->>>> sadece bize ait ec2 larin publiciplerini listelemek istersem 

aws ec2 describe-instances \
   --filters "Name = key-name, Values = KEY_NAME_HERE" --query "Reservations[].Instances[].PublicIpAddress[]" # put your key name  

aws ec2 describe-instances \
   --filters "Name = key-name, Values = bera " --query "Reservations[].Instances[].PublicIpAddress[]" -->>> kendi key namemi yazdim .





----->>> bu filtreleme islemi farkli sekillerde renklendirilebilir ve kullanilabilir .
     >>> simdide benim hesabimdaki   t2.micro makina tiplerinin  id lerini  listeleyelim 

aws ec2 describe-instances \
   --filters "Name = instance-type, Values = t2.micro" --query "Reservations[].Instances[].InstanceId[]" 




--->>> bana ait ec2makinalrin id lerini ve ip adreslerini listelemekmistersem  asagidaki kodu kullanabilirim 

aws ec2 describe-instances  \
  --filters "Name = instance-type, Values = t2.micro" "Name = key-name, Values = KEY_NAME_HERE" \
  --query "Reservations[].Instances[].{Instance:InstanceId,PublicIp:PublicIpAddress}" # put your key name


aws ec2 describe-instances  \
  --filters "Name = instance-type, Values = t2.micro" "Name = key-name, Values = bera" \  -->>  bize ait keypem 
  --query "Reservations[].Instances[].{Instance:InstanceId,PublicIp:PublicIpAddress}"




  ---->> bir ec2 nasil stop edilir 

aws ec2 stop-instances --instance-ids INSTANCE_ID_HERE # put your instance id  



--->> bir ec2 nasil terminate edilir 

aws ec2 terminate-instances --instance-ids INSTANCE_ID_HERE # put your instance id  




         -----   BITTI ----




        --->>>> arti bilgiler 

# Working with the latest Amazon Linux 2023 AMI


     ---->>> bu komut bize  bu regiondaki  amazon linux 2023 imaji hakkindaki en guncel bilgileri verir 

aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 --region us-east-1 


      ---->>> sadece imajid gormek istersek 

aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 --query 'Parameters[0].[Value]' --output text




aws ec2 run-instances \
   --image-id $(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 --query \
               'Parameters[0].[Value]' --output text) \
   --count 1 \
   --instance-type t2.micro

# For Amazon Linux 2 change  "al2023-ami-kernel-default-x86_64" to "amzn2-ami-hvm-x86_64".

# Update AWS CLI Version 1 on Amazon Linux-2 (comes default) to Version 2

# Remove AWS CLI Version 1
sudo yum remove awscli -y # pip uninstall awscli/pip3 uninstall awscli might also work depending on the image

# Install AWS CLI Version 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip  #install "unzip" if not installed
sudo ./aws/install

# Update the path accordingly if needed
export PATH=$PATH:/usr/local/bin/aws