#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif


varying COMPAT_PRECISION vec2 TEX0;
uniform COMPAT_PRECISION vec2 TextureSize;


#if defined(VERTEX)
uniform mat4 MVPMatrix;
attribute vec4 VertexCoord;
attribute vec2 TexCoord;
uniform vec2 InputSize;
uniform vec2 OutputSize;

void main()
{
	TEX0 = TexCoord;
	gl_Position = MVPMatrix * VertexCoord;
}

#elif defined(FRAGMENT)

uniform sampler2D Texture;

vec4 getTexel( vec2 p )
{
    p = p*TextureSize + 0.5;
    vec2 i = floor(p);
    vec2 f = p - i;
    vec2 nf = f*f*f*(f*(f*6.0-15.0)+10.0);
	p = i + nf;
    p = (p - 0.5)/TextureSize.xy;
    return texture2D( Texture, p );
}


vec4 getTexelmod( vec2 p )
{
    p = p*TextureSize + 0.5;
    vec2 i = floor(p);
    vec2 f = p - i;

    vec2 nf = vec2(smoothstep(0.0,1.0,f.x) , f.y);

	p = i + nf;
    p = (p - 0.5)/TextureSize.xy;
    return texture2D( Texture, p );
}

void main()
{
	vec2 texcoord = TEX0;	
	vec2 texcoordInPixels = texcoord * TextureSize;
	vec2 centerCoord = floor(texcoordInPixels.xy)+vec2(0.5,0.5);

	vec3 colour = getTexelmod(vec2(texcoord.x,(centerCoord.y)/TextureSize.y) ).rgb; //This is quilez for horz. scale

	colour = pow(colour.rgb, vec3(1.2));

	
	gl_FragColor = vec4(colour , 1.0);

}
#endif
