Shader "PhotoshopBlends/ScreenTwo" {
	Properties {
		_MainTex ("MainTex", 2D) = "white" {}
		_ScreenTex ("ScreenTex", 2D) = "black" {}
		_ScreenTwoTex("ScreenTwoTex", 2D) = "black" {}

	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		Pass {
			Lighting Off Fog { Mode Off }
			CGPROGRAM
			#include "Assets/PhotoshopBlends/Shaders/_Includes/Aub_Blends.cginc"
			#pragma vertex vert_uv0
			#pragma fragment frag

			sampler2D _MainTex, _ScreenTex, _ScreenTwoTex;

			float4 frag( v2f_uv0 i ) : COLOR {
				float4 a = tex2D(_MainTex, i.uv);
				float4 b = tex2D(_ScreenTex, i.uv);
				float4 c = tex2D(_ScreenTwoTex, i.uv);
				float4 d = Screen(a, b);
				return Screen(d, c);
			}
			ENDCG
		}
	}
}