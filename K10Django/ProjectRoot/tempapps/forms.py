from django import forms

'''
장고에서 제공하는 Form기능을 사용시 forms.Form 클래스 상속함
태그 생성시 required속성이 포함되어 기복적인 빈값에 대한 검증을 함

'''
class QuestionForm(forms. Form):
    #<input type="text"생성
    user_id = forms.CharField(label='아이디', max_length=10) 
    #가장기본적인 input생성
    title = forms.CharField() 
    #여러줄 입력가능한 textarea생성
    content = forms.CharField(widget=forms.Textarea) 
    #기본적인 이메일태그
    email = forms.EmailField()
    #체크박스생성
    my_check = forms.BooleanField(required=False)
    
class BoardWriteForm(forms. Form):
    #input 속성정의
    input_style={ 'class': 'form-control','style' :'width:100%'}
   
    name = forms.CharField(
        label='작성자', 
        widget=forms.TextInput(attrs=(input_style))
    )
    pw = forms.CharField(
        label='패스워드', 
        max_length=20, widget=forms.PasswordInput(attrs=(input_style))
    )
    title = forms.CharField(
        label='제목', 
        widget=forms.TextInput(attrs=(input_style))
    )
    content = forms.CharField(
        label='내용',
        widget=forms.Textarea(attrs=(input_style))
    )
    file = forms.FileField(
        label='첨부파일' ,
        widget=forms.FileInput(attrs=(input_style))
    )
    
    form1 = forms.CharField(widget=forms.PasswordInput(attrs={'size':30, 'value':1234}))
    
    #value/text로 사용됨
    data01 =[('red','빨강'), ('green','초록'), ('blue','파랑'), ('black','검정')]
    form2 = forms.ChoiceField(
        widget=forms.Select,
        choices=data01,
        initial='blue' #selected값
    )

    form3 = forms.MultipleChoiceField(
        widget=forms.SelectMultiple,
        choices=data01,
        initial=['blue', 'red'] #selected값
    )
    
    form4 = forms.ChoiceField(
        widget=forms.RadioSelect(attrs={ 'style':'display: inline-block;'}),
        choices=data01,
        initial=['blue'] #selected값
    )
    
    form5 =forms.MultipleChoiceField(
        widget=forms.CheckboxSelectMultiple,
        choices=data01,
        initial=['blue', 'red']
    )
   