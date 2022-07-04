/* Lex Program . */

%{
	/*contains declaration of all the tokens in th yacc program*/
#include "y.tab.h"
	/*variables used while validation*/
int a_valid = 0,end_tag1=0;
%}

/*Regular expressions to be matched while performaing lexical analysis*/

/*RE for whitespaces*/
Ws              ([ \t    ]+)

/*RE for letters*/
Letter          [A-Za-z]	

/*RE for digits*/
Digit           [0-9] 	

/*RE for identifiers*/
Name			{Letter}({Letter}|{Digit}|[_])*

/*RE for content inside <a> tag*/
Content     	{Name}|{Letter}|{Digit}

/*attributes of <a> tag*/
AAttrList		"download"|"href"|"hreflag"|"media"|"ping"|"referrerpolicy"|"rel"|"target"|"type"	

/*attribute list for <a> tag*/
AAttr 			{AAttrList}	

/*attributes of <img> tag*/
ImgAttList    	"height"|"width"|"crossorigin"|"use-credentials"|"ismap"|"loading"|"longdesc"|"referrerpolicy"|"no-referrer-when-downgrade"|"origin"|"origin-when-cross-origin"|"unsafe-url"|"sizes"|"usemap"	

/*attribute list for image tag*/
ImgOtherAtt     {ImgAttList}	

/*RE for attribute value*/
AttValue        (\"[^<&"]*\")|(\'[^<&']*\')
	
	//end of declaration section

%%
	/*translation rules
	pattern {
				action
			}
	*/

	/* "<"" will be matched here.*/
[<] { 	printf("\n [Parsing]: %s\n", yytext);
		return START_ANGLE_BRACKET;} 

	/* "a" will be matched here.*/
[a] { 		/*a_valid is used for validating content of <a> tag.*/
		a_valid =1;
		printf("\n [Parsing]: %s\n", yytext);
		return A_TAG;}

"img" { printf("\n [Parsing]: %s\n", yytext);
		return IMG_TAG;}

{Ws} {;}
	
	/*anchor tag's attribute is matched here*/
{AAttrList}{Ws}?[=]{Ws}?{AttValue}{Ws}? {
											//valid attribute for a tag
											printf("\n [Parsing]: %s\n", yytext);
								 			return A_ATTRIBUTE;	
										}

[>] { 	/*end_tag1 is used for validating content of <a> tag.*/
		end_tag1=1;
		printf("\n [Parsing]: %s\n", yytext);
		return END_TAG1;} 

		/*End tag for </a> is matched here*/
[<]{Ws}?[/]{Ws}?[a]{Ws}?[>]	{
								//valid endtag
								printf("\n [Parsing]: A end tag: %s\n", yytext);
								return A_END_TAG;	
								
							}

		/*Unlnown End tags matched here*/
[<]{Ws}?[/]{Ws}?{Name}{Ws}?[>]	{
								//valid endtag
								printf("\n [Parsing]: %s\n", yytext);
								yyerror("Unknown End Tag.");	
								
							}


	/*content inside <a> tag is matched here.*/
{Content} 	{
				if(a_valid==1 && end_tag1==1)
				{
					printf("\n [Parsing]: %s\n", yytext);
					return A_CONTENT;
				}
				else
				{
					printf("\n [Parsing]: %s\n", yytext);
 					yyerror("Unknown text.");
 				}

			}

	/*attribute src of image tag with attribute value is matched here.*/
"src"{Ws}?[=]{Ws}?{AttValue}{Ws}? 	{	
									
									printf("\n [Parsing] %s\n", yytext);
									return IMG_SRC;
									
								}

	/*attribute alt of image tag with attribute value is matched here.*/
"alt"{Ws}?[=]{Ws}?{AttValue}{Ws}?	{	
									
									printf("\n [Parsing]: %s\n", yytext);	
						 			return IMG_ALT;
									
								}

	/*all other valid img attributes is matched here*/
{ImgOtherAtt}{Ws}?[=]{Ws}?{AttValue}{Ws}?  	{
											//valid attribute for img tag
											printf("\n [Parsing]: %s\n", yytext);
								 			return IMG_OTHER_ATTRIBUTE;	
										}	

	/*all other attributes which are invalid are matched here*/
{Name}{Ws}?[=]{Ws}?{AttValue}{Ws}?	{
									//attribute list doesnot content this attribute
									printf("\n [Parsing]: %s\n", yytext);
									yyerror("Unknown attribute.");
								}	

	/*End tag for image "/>" is matched here*/
[/]{Ws}?[>]{Ws}?	{
			//valid endtag for img
			printf("\n [Parsing]: %s\n", yytext);
			return IMG_END_TAG2;	
		}


	/*End tag for image "></img> is matched here*/
[>]{Ws}?[<]{Ws}?[/]{Ws}?("img"){Ws}?[>]{Ws}?	{
				//valid endtag
				printf("\n [Parsing]: Image end tag: %s\n", yytext);
				return IMG_END_TAG3;	
				
			}

	/*newline character*/
[\n] { return NL; }

	/*Everything else is matched here.*/
. { printf("\n [Parsing]: %s\n", yytext);
 	yyerror("Unknown text.");}

%%

int yywrap()
{
	return 1;
}