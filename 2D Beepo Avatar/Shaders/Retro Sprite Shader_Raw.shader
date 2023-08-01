Shader "CustomShader/Retro Sprite Shader_Raw"
{
    Properties
    {
        [NoScaleOffset] Texture2D_EDBE768("TextureSheet", 2D) = "white" {}
        Vector1_1A634C25("WidthCount", Float) = 4
        Vector1_9619ED19("SideCount", Float) = 4
        Vector1_90743367("AnimFPS", Float) = 5
        Vector1_CCC059AD("SpriteOffsetIndex", Float) = 1
        Vector2_121B8647("Diffuse Tiling", Vector) = (1, 1, 0, 0)
        Vector2_9657DBB6("DiffuseOffset", Vector) = (0, 0, 0, 0)
        [Enum(Opaque, 0, Cutout, 1, Fade, 2, Transparent, 3, Additive, 4, Multiply, 5)]_Mode("Rendering Mode", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)]_SrcBlend("Source Blend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend", Float) = 0
        [Enum(Off, 0, On, 1)]_ZWrite("ZWrite", Float) = 1
        [Enum(Off, 0, On, 1)]_AlphaToMask("AlphaToMask", Float) = 0
        [HideInInspector][NonModifiableTextureData][NoScaleOffset]_DFG("Texture2D", 2D) = "white" {}
        [Enum(UnityEngine.Rendering.CullMode)]_Cull("Cull", Float) = 2
    }
        SubShader
        {
            Tags
            {
                "RenderPipeline" = ""
                "RenderType" = "Opaque"
                "Queue" = "Geometry+0"
            }

            Pass
            {
                Name "FORWARDBASE"
                Tags
                {
                // LightMode: <None>
            }

            // Render State
            Blend[_SrcBlend][_DstBlend]
            Cull[_Cull]
            // ZTest: <None>
            ZWrite[_ZWrite]
    AlphaToMask[_AlphaToMask]
            // ColorMask: <None>


            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            // Debug
            // <None>

            // --------------------------------------------------
            // Pass

            // Pragmas
            #pragma target 4.5
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            // Keywords
            #pragma shader_feature_local _ _ALPHATEST_ON _ALPHAPREMULTIPLY_ON _ALPHAMODULATE_ON
            // GraphKeywords: <None>



            // Defines
            #define ALPHATOCOVERAGE_ON



            #define _AlphaClip 1
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define VARYINGS_NEED_NORMAL_WS
            #define VARYINGS_NEED_TANGENT_WS
            #define VARYINGS_NEED_TEXCOORD0
            #define FEATURES_GRAPH_VERTEX
            //#pragma multi_compile_instancing
            #define SHADERPASS_UNLIT

            // Includes
            #include "UnityCG.cginc"
            #include "Packages/com.z3y.shadergraphex/hlsl/ShaderGraph.hlsl"

            #include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"



            // --------------------------------------------------
            // Graph

            // Graph Properties
            float Vector1_1A634C25;
            float Vector1_9619ED19;
            float Vector1_90743367;
            float Vector1_CCC059AD;
            float2 Vector2_121B8647;
            float2 Vector2_9657DBB6;
            TEXTURE2D(Texture2D_EDBE768); SAMPLER(samplerTexture2D_EDBE768); float4 Texture2D_EDBE768_TexelSize;
            SAMPLER(_SampleTexture2D_1BEA1C18_Sampler_3_Linear_Repeat);

            // Graph Functions

            void Unity_Multiply_float(float3 A, float3 B, out float3 Out)
            {
                Out = A * B;
            }

            void Unity_Multiply_float(float4x4 A, float4 B, out float4 Out)
            {
                Out = mul(A, B);
            }

            void Unity_Add_float3(float3 A, float3 B, out float3 Out)
            {
                Out = A + B;
            }

            void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
            {
                Out = UV * Tiling + Offset;
            }

            void Unity_Multiply_float(float A, float B, out float Out)
            {
                Out = A * B;
            }

            void Unity_Modulo_float(float A, float B, out float Out)
            {
                Out = fmod(A, B);
            }

            void Unity_Floor_float(float In, out float Out)
            {
                Out = floor(In);
            }

            void Unity_Arctangent2_float(float A, float B, out float Out)
            {
                Out = atan2(A, B);
            }

            void Unity_Comparison_NotEqual_float(float A, float B, out float Out)
            {
                Out = A != B ? 1 : 0;
            }

            void Unity_And_float(float A, float B, out float Out)
            {
                Out = A && B;
            }

            struct Bindings_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa
            {
            };

            void SG_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa(Bindings_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa IN, out float IsinMirror_0)
            {
                float4 _MatrixSplit_C6B6C774_M0_1 = UNITY_MATRIX_P[0];
                float4 _MatrixSplit_C6B6C774_M1_2 = UNITY_MATRIX_P[1];
                float4 _MatrixSplit_C6B6C774_M2_3 = UNITY_MATRIX_P[2];
                float4 _MatrixSplit_C6B6C774_M3_4 = UNITY_MATRIX_P[3];
                float _Split_90EA02E8_R_1 = _MatrixSplit_C6B6C774_M2_3[0];
                float _Split_90EA02E8_G_2 = _MatrixSplit_C6B6C774_M2_3[1];
                float _Split_90EA02E8_B_3 = _MatrixSplit_C6B6C774_M2_3[2];
                float _Split_90EA02E8_A_4 = _MatrixSplit_C6B6C774_M2_3[3];
                float _Comparison_A1F7A00F_Out_2;
                Unity_Comparison_NotEqual_float(_Split_90EA02E8_R_1, 0, _Comparison_A1F7A00F_Out_2);
                float _Comparison_6E3E9B70_Out_2;
                Unity_Comparison_NotEqual_float(_Split_90EA02E8_G_2, 0, _Comparison_6E3E9B70_Out_2);
                float _And_BEA0F8D5_Out_2;
                Unity_And_float(_Comparison_A1F7A00F_Out_2, _Comparison_6E3E9B70_Out_2, _And_BEA0F8D5_Out_2);
                IsinMirror_0 = _And_BEA0F8D5_Out_2;
            }

            void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
            {
                Out = Predicate ? True : False;
            }

            void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
            {
                Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
            }

            void Unity_Round_float(float In, out float Out)
            {
                Out = round(In);
            }

            void Unity_Add_float(float A, float B, out float Out)
            {
                Out = A + B;
            }

            void Unity_Flipbook_float(float2 UV, float Width, float Height, float Tile, float2 Invert, out float2 Out)
            {
                Tile = fmod(Tile, Width * Height);
                float2 tileCount = float2(1.0, 1.0) / float2(Width, Height);
                float tileY = abs(Invert.y * Height - (floor(Tile * tileCount.x) + Invert.y * 1));
                float tileX = abs(Invert.x * Width - ((Tile - Width * floor(Tile * tileCount.x)) + Invert.x * 1));
                Out = (UV + float2(tileX, tileY)) * tileCount;
            }

            // Graph Vertex
            struct VertexDescriptionInputs
            {
                float3 ObjectSpaceNormal;
                float3 WorldSpaceNormal;
                float3 ObjectSpaceTangent;
                float3 WorldSpaceTangent;
                float3 ObjectSpaceBiTangent;
                float3 WorldSpaceBiTangent;
                float3 ObjectSpacePosition;
            };

            struct VertexDescription
            {
                float3 VertexPosition;
                float3 VertexNormal;
                float3 VertexTangent;
            };

            VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
            {
                VertexDescription description = (VertexDescription)0;
                float3 _Multiply_47A3CB65_Out_2;
                Unity_Multiply_float(IN.ObjectSpacePosition, float3(length(float3(UNITY_MATRIX_M[0].x, UNITY_MATRIX_M[1].x, UNITY_MATRIX_M[2].x)),
                                         length(float3(UNITY_MATRIX_M[0].y, UNITY_MATRIX_M[1].y, UNITY_MATRIX_M[2].y)),
                                         length(float3(UNITY_MATRIX_M[0].z, UNITY_MATRIX_M[1].z, UNITY_MATRIX_M[2].z))), _Multiply_47A3CB65_Out_2);
                float _Split_6DD7C587_R_1 = _Multiply_47A3CB65_Out_2[0];
                float _Split_6DD7C587_G_2 = _Multiply_47A3CB65_Out_2[1];
                float _Split_6DD7C587_B_3 = _Multiply_47A3CB65_Out_2[2];
                float _Split_6DD7C587_A_4 = 0;
                float4 _Vector4_DA5DF26F_Out_0 = float4(_Split_6DD7C587_R_1, _Split_6DD7C587_G_2, _Split_6DD7C587_B_3, 0);
                float4 _Multiply_A910F1E_Out_2;
                Unity_Multiply_float(UNITY_MATRIX_I_V, _Vector4_DA5DF26F_Out_0, _Multiply_A910F1E_Out_2);
                float3 _Add_DC562BE1_Out_2;
                Unity_Add_float3((_Multiply_A910F1E_Out_2.xyz), SHADERGRAPH_OBJECT_POSITION, _Add_DC562BE1_Out_2);
                float3 _Transform_9CE384C6_Out_1 = TransformWorldToObject(_Add_DC562BE1_Out_2.xyz);
                float _Split_65658CE2_R_1 = _Transform_9CE384C6_Out_1[0];
                float _Split_65658CE2_G_2 = _Transform_9CE384C6_Out_1[1];
                float _Split_65658CE2_B_3 = _Transform_9CE384C6_Out_1[2];
                float _Split_65658CE2_A_4 = 0;
                float3 _Vector3_8C58CA10_Out_0 = float3(_Split_65658CE2_R_1, _Split_65658CE2_G_2, _Split_65658CE2_B_3);
                description.VertexPosition = _Vector3_8C58CA10_Out_0;
                description.VertexNormal = IN.ObjectSpaceNormal;
                description.VertexTangent = IN.ObjectSpaceTangent;
                return description;
            }

            // Graph Pixel
            struct SurfaceDescriptionInputs
            {
                float3 WorldSpaceNormal;
                float3 WorldSpaceTangent;
                float3 WorldSpaceBiTangent;
                float4 uv0;
            };

            struct SurfaceDescription
            {
                float3 Color;
                float Alpha;
                float AlphaClipThreshold;
            };

            SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
            {
                SurfaceDescription surface = (SurfaceDescription)0;
                float2 _Property_69E2CF98_Out_0 = Vector2_121B8647;
                float2 _Property_F96E7FCB_Out_0 = Vector2_9657DBB6;
                float2 _TilingAndOffset_44D39E0F_Out_3;
                Unity_TilingAndOffset_float(IN.uv0.xy, _Property_69E2CF98_Out_0, _Property_F96E7FCB_Out_0, _TilingAndOffset_44D39E0F_Out_3);
                float _Property_539C7CBE_Out_0 = Vector1_1A634C25;
                float _Property_8E1CB8C_Out_0 = Vector1_9619ED19;
                float _Property_B04F7EE1_Out_0 = Vector1_90743367;
                float _Property_2D09C05F_Out_0 = Vector1_CCC059AD;
                float _Multiply_44C0C4BF_Out_2;
                Unity_Multiply_float(_Property_B04F7EE1_Out_0, _Property_2D09C05F_Out_0, _Multiply_44C0C4BF_Out_2);
                float _Property_86301A3F_Out_0 = Vector1_1A634C25;
                float _Modulo_4FCAA92A_Out_2;
                Unity_Modulo_float(_Multiply_44C0C4BF_Out_2, _Property_86301A3F_Out_0, _Modulo_4FCAA92A_Out_2);
                float _Floor_309178C2_Out_1;
                Unity_Floor_float(_Modulo_4FCAA92A_Out_2, _Floor_309178C2_Out_1);
                float _Property_AA56F73_Out_0 = Vector1_1A634C25;
                float _Property_C36885FA_Out_0 = Vector1_9619ED19;
                float3 _Transform_3B47A237_Out_1 = TransformWorldToObjectDir(-1 * mul((float3x3)UNITY_MATRIX_M, transpose(mul(UNITY_MATRIX_I_M, UNITY_MATRIX_I_V))[2].xyz).xyz);
                float _Split_5C1B675_R_1 = _Transform_3B47A237_Out_1[0];
                float _Split_5C1B675_G_2 = _Transform_3B47A237_Out_1[1];
                float _Split_5C1B675_B_3 = _Transform_3B47A237_Out_1[2];
                float _Split_5C1B675_A_4 = 0;
                float _Arctangent2_7D2233AF_Out_2;
                Unity_Arctangent2_float(_Split_5C1B675_R_1, _Split_5C1B675_B_3, _Arctangent2_7D2233AF_Out_2);
                Bindings_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa _IsInMirror_6074C2EB;
                float _IsInMirror_6074C2EB_IsinMirror_0;
                SG_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa(_IsInMirror_6074C2EB, _IsInMirror_6074C2EB_IsinMirror_0);
                float2 _Vector2_7B13F3B1_Out_0 = float2(1, 0);
                float2 _Vector2_402D55A6_Out_0 = float2(0, 1);
                float2 _Branch_8A96B213_Out_3;
                Unity_Branch_float2(_IsInMirror_6074C2EB_IsinMirror_0, _Vector2_7B13F3B1_Out_0, _Vector2_402D55A6_Out_0, _Branch_8A96B213_Out_3);
                float _Remap_965CDB29_Out_3;
                Unity_Remap_float(_Arctangent2_7D2233AF_Out_2, float2 (-3.14, 3.14), _Branch_8A96B213_Out_3, _Remap_965CDB29_Out_3);
                float _Multiply_DAA79C9E_Out_2;
                Unity_Multiply_float(_Property_C36885FA_Out_0, _Remap_965CDB29_Out_3, _Multiply_DAA79C9E_Out_2);
                float _Round_408C3219_Out_1;
                Unity_Round_float(_Multiply_DAA79C9E_Out_2, _Round_408C3219_Out_1);
                float _Multiply_B93F5F61_Out_2;
                Unity_Multiply_float(_Property_AA56F73_Out_0, _Round_408C3219_Out_1, _Multiply_B93F5F61_Out_2);
                float _Add_7C457B2A_Out_2;
                Unity_Add_float(_Floor_309178C2_Out_1, _Multiply_B93F5F61_Out_2, _Add_7C457B2A_Out_2);
                float2 _Flipbook_A99F271E_Out_4;
                float2 _Flipbook_A99F271E_Invert = float2 (0, 1);
                Unity_Flipbook_float(_TilingAndOffset_44D39E0F_Out_3, _Property_539C7CBE_Out_0, _Property_8E1CB8C_Out_0, _Add_7C457B2A_Out_2, _Flipbook_A99F271E_Invert, _Flipbook_A99F271E_Out_4);
                float4 _SampleTexture2D_1BEA1C18_RGBA_0 = SAMPLE_TEXTURE2D(Texture2D_EDBE768, samplerTexture2D_EDBE768, _Flipbook_A99F271E_Out_4);
                float _SampleTexture2D_1BEA1C18_R_4 = _SampleTexture2D_1BEA1C18_RGBA_0.r;
                float _SampleTexture2D_1BEA1C18_G_5 = _SampleTexture2D_1BEA1C18_RGBA_0.g;
                float _SampleTexture2D_1BEA1C18_B_6 = _SampleTexture2D_1BEA1C18_RGBA_0.b;
                float _SampleTexture2D_1BEA1C18_A_7 = _SampleTexture2D_1BEA1C18_RGBA_0.a;
                surface.Color = (_SampleTexture2D_1BEA1C18_RGBA_0.xyz);
                surface.Alpha = _SampleTexture2D_1BEA1C18_A_7;
                surface.AlphaClipThreshold = 0.5;
                return surface;
            }

            // --------------------------------------------------
            // Structs and Packing

            // Generated Type: Attributes
            struct Attributes
            {
                float3 positionOS : POSITION;
                float3 normalOS : NORMAL;
                float4 tangentOS : TANGENT;
                float4 uv0 : TEXCOORD0;
                #if UNITY_ANY_INSTANCING_ENABLED
                uint instanceID : INSTANCEID_SEMANTIC;
                #endif
            };

            // Generated Type: Varyings
            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float3 normalWS;
                float4 tangentWS;
                float4 texCoord0;
                #if defined(FOG_ANY)
                float fogCoord : FOG_COORD;
                #endif
                #if UNITY_ANY_INSTANCING_ENABLED
                uint instanceID : SV_InstanceID;
                #endif
                #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
                #endif
                #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
                #endif
                #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
                #endif
            };

            // Generated Type: PackedVaryings
            struct PackedVaryings
            {
                float4 positionCS : SV_POSITION;
                #if defined(FOG_ANY)
                float fogCoord : FOG_COORD;
                #endif
                #if UNITY_ANY_INSTANCING_ENABLED
                uint instanceID : SV_InstanceID;
                #endif
                float3 interp00 : TEXCOORD0;
                float4 interp01 : TEXCOORD1;
                float4 interp02 : TEXCOORD2;
                #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
                #endif
                #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
                #endif
                #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
                #endif
            };

            // Packed Type: Varyings
            PackedVaryings PackVaryings(Varyings input)
            {
                PackedVaryings output = (PackedVaryings)0;
                output.positionCS = input.positionCS;
                output.interp00.xyz = input.normalWS;
                output.interp01.xyzw = input.tangentWS;
                output.interp02.xyzw = input.texCoord0;
                #if defined(FOG_ANY)
                output.fogCoord = input.fogCoord;
                #endif
                #if UNITY_ANY_INSTANCING_ENABLED
                output.instanceID = input.instanceID;
                #endif
                #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
                #endif
                #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
                #endif
                #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                output.cullFace = input.cullFace;
                #endif
                return output;
            }

            // Unpacked Type: Varyings
            Varyings UnpackVaryings(PackedVaryings input)
            {
                Varyings output = (Varyings)0;
                output.positionCS = input.positionCS;
                output.normalWS = input.interp00.xyz;
                output.tangentWS = input.interp01.xyzw;
                output.texCoord0 = input.interp02.xyzw;
                #if defined(FOG_ANY)
                output.fogCoord = input.fogCoord;
                #endif
                #if UNITY_ANY_INSTANCING_ENABLED
                output.instanceID = input.instanceID;
                #endif
                #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
                #endif
                #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
                #endif
                #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                output.cullFace = input.cullFace;
                #endif
                return output;
            }

            // --------------------------------------------------
            // Build Graph Inputs

            VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
            {
                VertexDescriptionInputs output = (VertexDescriptionInputs)0;

                output.ObjectSpaceNormal = input.normalOS;
                output.WorldSpaceNormal = TransformObjectToWorldNormal(input.normalOS);
                output.ObjectSpaceTangent = input.tangentOS;
                output.WorldSpaceTangent = TransformObjectToWorldDir(input.tangentOS.xyz);
                output.ObjectSpaceBiTangent = normalize(cross(input.normalOS, input.tangentOS) * (input.tangentOS.w > 0.0f ? 1.0f : -1.0f) * GetOddNegativeScale());
                output.WorldSpaceBiTangent = TransformObjectToWorldDir(output.ObjectSpaceBiTangent);
                output.ObjectSpacePosition = input.positionOS;

                return output;
            }

            SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
            {
                SurfaceDescriptionInputs output = (SurfaceDescriptionInputs)0;


                // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
                float3 unnormalizedNormalWS = input.normalWS;
                const float renormFactor = 1.0 / length(unnormalizedNormalWS);

                // use bitangent on the fly like in hdrp
                // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
                float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
                float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);

                output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;		// we want a unit length Normal Vector node in shader graph

                // to preserve mikktspace compliance we use same scale renormFactor as was used on the normal.
                // This is explained in section 2.2 in "surface gradient based bump mapping framework"
                output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
                output.WorldSpaceBiTangent = renormFactor * bitang;

                output.uv0 = input.texCoord0;
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
            #else
            #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
            #endif
            #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

                return output;
            }


            // --------------------------------------------------
            // Main

            #include "Packages/com.z3y.shadergraphex/hlsl/Varyings.hlsl"
            #include "Packages/com.z3y.shadergraphex/hlsl/UnlitPass.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "SHADOWCASTER"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }

                // Render State
                // Blending: <None>
                Cull[_Cull]
                ZTest LEqual
                ZWrite On
                // ColorMask: <None>


                HLSLPROGRAM
                #pragma vertex vert
                #pragma fragment frag

                // Debug
                // <None>

                // --------------------------------------------------
                // Pass

                // Pragmas
                #pragma target 4.5
                #pragma multi_compile_instancing
                #pragma multi_compile_shadowcaster

                // Keywords
                #pragma shader_feature_local _ _ALPHATEST_ON _ALPHAPREMULTIPLY_ON _ALPHAFADE_ON
                // GraphKeywords: <None>



                // Defines



                #define _AlphaClip 1
                #define ATTRIBUTES_NEED_NORMAL
                #define ATTRIBUTES_NEED_TANGENT
                #define ATTRIBUTES_NEED_TEXCOORD0
                #define VARYINGS_NEED_NORMAL_WS
                #define VARYINGS_NEED_TANGENT_WS
                #define VARYINGS_NEED_TEXCOORD0
                #define FEATURES_GRAPH_VERTEX
                //#pragma multi_compile_instancing
                #define SHADERPASS_SHADOWCASTER

                // Includes
                #include "UnityCG.cginc"
                #include "Packages/com.z3y.shadergraphex/hlsl/ShaderGraph.hlsl"

                #include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"



                // --------------------------------------------------
                // Graph

                // Graph Properties
                float Vector1_1A634C25;
                float Vector1_9619ED19;
                float Vector1_90743367;
                float Vector1_CCC059AD;
                float2 Vector2_121B8647;
                float2 Vector2_9657DBB6;
                TEXTURE2D(Texture2D_EDBE768); SAMPLER(samplerTexture2D_EDBE768); float4 Texture2D_EDBE768_TexelSize;
                SAMPLER(_SampleTexture2D_1BEA1C18_Sampler_3_Linear_Repeat);

                // Graph Functions

                void Unity_Multiply_float(float3 A, float3 B, out float3 Out)
                {
                    Out = A * B;
                }

                void Unity_Multiply_float(float4x4 A, float4 B, out float4 Out)
                {
                    Out = mul(A, B);
                }

                void Unity_Add_float3(float3 A, float3 B, out float3 Out)
                {
                    Out = A + B;
                }

                void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
                {
                    Out = UV * Tiling + Offset;
                }

                void Unity_Multiply_float(float A, float B, out float Out)
                {
                    Out = A * B;
                }

                void Unity_Modulo_float(float A, float B, out float Out)
                {
                    Out = fmod(A, B);
                }

                void Unity_Floor_float(float In, out float Out)
                {
                    Out = floor(In);
                }

                void Unity_Arctangent2_float(float A, float B, out float Out)
                {
                    Out = atan2(A, B);
                }

                void Unity_Comparison_NotEqual_float(float A, float B, out float Out)
                {
                    Out = A != B ? 1 : 0;
                }

                void Unity_And_float(float A, float B, out float Out)
                {
                    Out = A && B;
                }

                struct Bindings_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa
                {
                };

                void SG_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa(Bindings_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa IN, out float IsinMirror_0)
                {
                    float4 _MatrixSplit_C6B6C774_M0_1 = UNITY_MATRIX_P[0];
                    float4 _MatrixSplit_C6B6C774_M1_2 = UNITY_MATRIX_P[1];
                    float4 _MatrixSplit_C6B6C774_M2_3 = UNITY_MATRIX_P[2];
                    float4 _MatrixSplit_C6B6C774_M3_4 = UNITY_MATRIX_P[3];
                    float _Split_90EA02E8_R_1 = _MatrixSplit_C6B6C774_M2_3[0];
                    float _Split_90EA02E8_G_2 = _MatrixSplit_C6B6C774_M2_3[1];
                    float _Split_90EA02E8_B_3 = _MatrixSplit_C6B6C774_M2_3[2];
                    float _Split_90EA02E8_A_4 = _MatrixSplit_C6B6C774_M2_3[3];
                    float _Comparison_A1F7A00F_Out_2;
                    Unity_Comparison_NotEqual_float(_Split_90EA02E8_R_1, 0, _Comparison_A1F7A00F_Out_2);
                    float _Comparison_6E3E9B70_Out_2;
                    Unity_Comparison_NotEqual_float(_Split_90EA02E8_G_2, 0, _Comparison_6E3E9B70_Out_2);
                    float _And_BEA0F8D5_Out_2;
                    Unity_And_float(_Comparison_A1F7A00F_Out_2, _Comparison_6E3E9B70_Out_2, _And_BEA0F8D5_Out_2);
                    IsinMirror_0 = _And_BEA0F8D5_Out_2;
                }

                void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
                {
                    Out = Predicate ? True : False;
                }

                void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
                {
                    Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
                }

                void Unity_Round_float(float In, out float Out)
                {
                    Out = round(In);
                }

                void Unity_Add_float(float A, float B, out float Out)
                {
                    Out = A + B;
                }

                void Unity_Flipbook_float(float2 UV, float Width, float Height, float Tile, float2 Invert, out float2 Out)
                {
                    Tile = fmod(Tile, Width * Height);
                    float2 tileCount = float2(1.0, 1.0) / float2(Width, Height);
                    float tileY = abs(Invert.y * Height - (floor(Tile * tileCount.x) + Invert.y * 1));
                    float tileX = abs(Invert.x * Width - ((Tile - Width * floor(Tile * tileCount.x)) + Invert.x * 1));
                    Out = (UV + float2(tileX, tileY)) * tileCount;
                }

                // Graph Vertex
                struct VertexDescriptionInputs
                {
                    float3 ObjectSpaceNormal;
                    float3 WorldSpaceNormal;
                    float3 ObjectSpaceTangent;
                    float3 WorldSpaceTangent;
                    float3 ObjectSpaceBiTangent;
                    float3 WorldSpaceBiTangent;
                    float3 ObjectSpacePosition;
                };

                struct VertexDescription
                {
                    float3 VertexPosition;
                    float3 VertexNormal;
                };

                VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
                {
                    VertexDescription description = (VertexDescription)0;
                    float3 _Multiply_47A3CB65_Out_2;
                    Unity_Multiply_float(IN.ObjectSpacePosition, float3(length(float3(UNITY_MATRIX_M[0].x, UNITY_MATRIX_M[1].x, UNITY_MATRIX_M[2].x)),
                                             length(float3(UNITY_MATRIX_M[0].y, UNITY_MATRIX_M[1].y, UNITY_MATRIX_M[2].y)),
                                             length(float3(UNITY_MATRIX_M[0].z, UNITY_MATRIX_M[1].z, UNITY_MATRIX_M[2].z))), _Multiply_47A3CB65_Out_2);
                    float _Split_6DD7C587_R_1 = _Multiply_47A3CB65_Out_2[0];
                    float _Split_6DD7C587_G_2 = _Multiply_47A3CB65_Out_2[1];
                    float _Split_6DD7C587_B_3 = _Multiply_47A3CB65_Out_2[2];
                    float _Split_6DD7C587_A_4 = 0;
                    float4 _Vector4_DA5DF26F_Out_0 = float4(_Split_6DD7C587_R_1, _Split_6DD7C587_G_2, _Split_6DD7C587_B_3, 0);
                    float4 _Multiply_A910F1E_Out_2;
                    Unity_Multiply_float(UNITY_MATRIX_I_V, _Vector4_DA5DF26F_Out_0, _Multiply_A910F1E_Out_2);
                    float3 _Add_DC562BE1_Out_2;
                    Unity_Add_float3((_Multiply_A910F1E_Out_2.xyz), SHADERGRAPH_OBJECT_POSITION, _Add_DC562BE1_Out_2);
                    float3 _Transform_9CE384C6_Out_1 = TransformWorldToObject(_Add_DC562BE1_Out_2.xyz);
                    float _Split_65658CE2_R_1 = _Transform_9CE384C6_Out_1[0];
                    float _Split_65658CE2_G_2 = _Transform_9CE384C6_Out_1[1];
                    float _Split_65658CE2_B_3 = _Transform_9CE384C6_Out_1[2];
                    float _Split_65658CE2_A_4 = 0;
                    float3 _Vector3_8C58CA10_Out_0 = float3(_Split_65658CE2_R_1, _Split_65658CE2_G_2, _Split_65658CE2_B_3);
                    description.VertexPosition = _Vector3_8C58CA10_Out_0;
                    description.VertexNormal = IN.ObjectSpaceNormal;
                    return description;
                }

                // Graph Pixel
                struct SurfaceDescriptionInputs
                {
                    float3 WorldSpaceNormal;
                    float3 WorldSpaceTangent;
                    float3 WorldSpaceBiTangent;
                    float4 uv0;
                };

                struct SurfaceDescription
                {
                    float Alpha;
                    float AlphaClipThreshold;
                };

                SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
                {
                    SurfaceDescription surface = (SurfaceDescription)0;
                    float2 _Property_69E2CF98_Out_0 = Vector2_121B8647;
                    float2 _Property_F96E7FCB_Out_0 = Vector2_9657DBB6;
                    float2 _TilingAndOffset_44D39E0F_Out_3;
                    Unity_TilingAndOffset_float(IN.uv0.xy, _Property_69E2CF98_Out_0, _Property_F96E7FCB_Out_0, _TilingAndOffset_44D39E0F_Out_3);
                    float _Property_539C7CBE_Out_0 = Vector1_1A634C25;
                    float _Property_8E1CB8C_Out_0 = Vector1_9619ED19;
                    float _Property_B04F7EE1_Out_0 = Vector1_90743367;
                    float _Property_2D09C05F_Out_0 = Vector1_CCC059AD;
                    float _Multiply_44C0C4BF_Out_2;
                    Unity_Multiply_float(_Property_B04F7EE1_Out_0, _Property_2D09C05F_Out_0, _Multiply_44C0C4BF_Out_2);
                    float _Property_86301A3F_Out_0 = Vector1_1A634C25;
                    float _Modulo_4FCAA92A_Out_2;
                    Unity_Modulo_float(_Multiply_44C0C4BF_Out_2, _Property_86301A3F_Out_0, _Modulo_4FCAA92A_Out_2);
                    float _Floor_309178C2_Out_1;
                    Unity_Floor_float(_Modulo_4FCAA92A_Out_2, _Floor_309178C2_Out_1);
                    float _Property_AA56F73_Out_0 = Vector1_1A634C25;
                    float _Property_C36885FA_Out_0 = Vector1_9619ED19;
                    float3 _Transform_3B47A237_Out_1 = TransformWorldToObjectDir(-1 * mul((float3x3)UNITY_MATRIX_M, transpose(mul(UNITY_MATRIX_I_M, UNITY_MATRIX_I_V))[2].xyz).xyz);
                    float _Split_5C1B675_R_1 = _Transform_3B47A237_Out_1[0];
                    float _Split_5C1B675_G_2 = _Transform_3B47A237_Out_1[1];
                    float _Split_5C1B675_B_3 = _Transform_3B47A237_Out_1[2];
                    float _Split_5C1B675_A_4 = 0;
                    float _Arctangent2_7D2233AF_Out_2;
                    Unity_Arctangent2_float(_Split_5C1B675_R_1, _Split_5C1B675_B_3, _Arctangent2_7D2233AF_Out_2);
                    Bindings_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa _IsInMirror_6074C2EB;
                    float _IsInMirror_6074C2EB_IsinMirror_0;
                    SG_IsInMirror_ce8a05b1dff82f0448aefc9bdb894daa(_IsInMirror_6074C2EB, _IsInMirror_6074C2EB_IsinMirror_0);
                    float2 _Vector2_7B13F3B1_Out_0 = float2(1, 0);
                    float2 _Vector2_402D55A6_Out_0 = float2(0, 1);
                    float2 _Branch_8A96B213_Out_3;
                    Unity_Branch_float2(_IsInMirror_6074C2EB_IsinMirror_0, _Vector2_7B13F3B1_Out_0, _Vector2_402D55A6_Out_0, _Branch_8A96B213_Out_3);
                    float _Remap_965CDB29_Out_3;
                    Unity_Remap_float(_Arctangent2_7D2233AF_Out_2, float2 (-3.14, 3.14), _Branch_8A96B213_Out_3, _Remap_965CDB29_Out_3);
                    float _Multiply_DAA79C9E_Out_2;
                    Unity_Multiply_float(_Property_C36885FA_Out_0, _Remap_965CDB29_Out_3, _Multiply_DAA79C9E_Out_2);
                    float _Round_408C3219_Out_1;
                    Unity_Round_float(_Multiply_DAA79C9E_Out_2, _Round_408C3219_Out_1);
                    float _Multiply_B93F5F61_Out_2;
                    Unity_Multiply_float(_Property_AA56F73_Out_0, _Round_408C3219_Out_1, _Multiply_B93F5F61_Out_2);
                    float _Add_7C457B2A_Out_2;
                    Unity_Add_float(_Floor_309178C2_Out_1, _Multiply_B93F5F61_Out_2, _Add_7C457B2A_Out_2);
                    float2 _Flipbook_A99F271E_Out_4;
                    float2 _Flipbook_A99F271E_Invert = float2 (0, 1);
                    Unity_Flipbook_float(_TilingAndOffset_44D39E0F_Out_3, _Property_539C7CBE_Out_0, _Property_8E1CB8C_Out_0, _Add_7C457B2A_Out_2, _Flipbook_A99F271E_Invert, _Flipbook_A99F271E_Out_4);
                    float4 _SampleTexture2D_1BEA1C18_RGBA_0 = SAMPLE_TEXTURE2D(Texture2D_EDBE768, samplerTexture2D_EDBE768, _Flipbook_A99F271E_Out_4);
                    float _SampleTexture2D_1BEA1C18_R_4 = _SampleTexture2D_1BEA1C18_RGBA_0.r;
                    float _SampleTexture2D_1BEA1C18_G_5 = _SampleTexture2D_1BEA1C18_RGBA_0.g;
                    float _SampleTexture2D_1BEA1C18_B_6 = _SampleTexture2D_1BEA1C18_RGBA_0.b;
                    float _SampleTexture2D_1BEA1C18_A_7 = _SampleTexture2D_1BEA1C18_RGBA_0.a;
                    surface.Alpha = _SampleTexture2D_1BEA1C18_A_7;
                    surface.AlphaClipThreshold = 0.5;
                    return surface;
                }

                // --------------------------------------------------
                // Structs and Packing

                // Generated Type: Attributes
                struct Attributes
                {
                    float3 positionOS : POSITION;
                    float3 normalOS : NORMAL;
                    float4 tangentOS : TANGENT;
                    float4 uv0 : TEXCOORD0;
                    #if UNITY_ANY_INSTANCING_ENABLED
                    uint instanceID : INSTANCEID_SEMANTIC;
                    #endif
                };

                // Generated Type: Varyings
                struct Varyings
                {
                    float4 positionCS : SV_POSITION;
                    float3 normalWS;
                    float4 tangentWS;
                    float4 texCoord0;
                    #if defined(FOG_ANY)
                    float fogCoord : FOG_COORD;
                    #endif
                    #if UNITY_ANY_INSTANCING_ENABLED
                    uint instanceID : SV_InstanceID;
                    #endif
                    #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                    uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
                    #endif
                    #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                    uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
                    #endif
                    #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                    FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
                    #endif
                };

                // Generated Type: PackedVaryings
                struct PackedVaryings
                {
                    float4 positionCS : SV_POSITION;
                    #if defined(FOG_ANY)
                    float fogCoord : FOG_COORD;
                    #endif
                    #if UNITY_ANY_INSTANCING_ENABLED
                    uint instanceID : SV_InstanceID;
                    #endif
                    float3 interp00 : TEXCOORD0;
                    float4 interp01 : TEXCOORD1;
                    float4 interp02 : TEXCOORD2;
                    #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                    uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
                    #endif
                    #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                    uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
                    #endif
                    #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                    FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
                    #endif
                };

                // Packed Type: Varyings
                PackedVaryings PackVaryings(Varyings input)
                {
                    PackedVaryings output = (PackedVaryings)0;
                    output.positionCS = input.positionCS;
                    output.interp00.xyz = input.normalWS;
                    output.interp01.xyzw = input.tangentWS;
                    output.interp02.xyzw = input.texCoord0;
                    #if defined(FOG_ANY)
                    output.fogCoord = input.fogCoord;
                    #endif
                    #if UNITY_ANY_INSTANCING_ENABLED
                    output.instanceID = input.instanceID;
                    #endif
                    #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                    output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
                    #endif
                    #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                    output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
                    #endif
                    #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                    output.cullFace = input.cullFace;
                    #endif
                    return output;
                }

                // Unpacked Type: Varyings
                Varyings UnpackVaryings(PackedVaryings input)
                {
                    Varyings output = (Varyings)0;
                    output.positionCS = input.positionCS;
                    output.normalWS = input.interp00.xyz;
                    output.tangentWS = input.interp01.xyzw;
                    output.texCoord0 = input.interp02.xyzw;
                    #if defined(FOG_ANY)
                    output.fogCoord = input.fogCoord;
                    #endif
                    #if UNITY_ANY_INSTANCING_ENABLED
                    output.instanceID = input.instanceID;
                    #endif
                    #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
                    output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
                    #endif
                    #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
                    output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
                    #endif
                    #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                    output.cullFace = input.cullFace;
                    #endif
                    return output;
                }

                // --------------------------------------------------
                // Build Graph Inputs

                VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
                {
                    VertexDescriptionInputs output = (VertexDescriptionInputs)0;

                    output.ObjectSpaceNormal = input.normalOS;
                    output.WorldSpaceNormal = TransformObjectToWorldNormal(input.normalOS);
                    output.ObjectSpaceTangent = input.tangentOS;
                    output.WorldSpaceTangent = TransformObjectToWorldDir(input.tangentOS.xyz);
                    output.ObjectSpaceBiTangent = normalize(cross(input.normalOS, input.tangentOS) * (input.tangentOS.w > 0.0f ? 1.0f : -1.0f) * GetOddNegativeScale());
                    output.WorldSpaceBiTangent = TransformObjectToWorldDir(output.ObjectSpaceBiTangent);
                    output.ObjectSpacePosition = input.positionOS;

                    return output;
                }

                SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
                {
                    SurfaceDescriptionInputs output = (SurfaceDescriptionInputs)0;


                    // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
                    float3 unnormalizedNormalWS = input.normalWS;
                    const float renormFactor = 1.0 / length(unnormalizedNormalWS);

                    // use bitangent on the fly like in hdrp
                    // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
                    float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
                    float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);

                    output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;		// we want a unit length Normal Vector node in shader graph

                    // to preserve mikktspace compliance we use same scale renormFactor as was used on the normal.
                    // This is explained in section 2.2 in "surface gradient based bump mapping framework"
                    output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
                    output.WorldSpaceBiTangent = renormFactor * bitang;

                    output.uv0 = input.texCoord0;
                #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
                #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
                #else
                #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
                #endif
                #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

                    return output;
                }


                // --------------------------------------------------
                // Main

                #include "Packages/com.z3y.shadergraphex/hlsl/Varyings.hlsl"
                #include "Packages/com.z3y.shadergraphex/hlsl/ShadowCasterPass.hlsl"

                ENDHLSL
            }

        }
            CustomEditor "z3y.ShaderGraphExtended.DefaultInspector"
}
