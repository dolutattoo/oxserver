"use strict";(self.webpackChunknpwd_nui=self.webpackChunknpwd_nui||[]).push([[3311],{33311:function(n,e,t){t.r(e),t.d(e,{SnackbarContent:function(){return pn},SnackbarProvider:function(){return Mn},Transition:function(){return A},closeSnackbar:function(){return yn},enqueueSnackbar:function(){return kn},useSnackbar:function(){return qn}});var r=t(92950),i=t.n(r),o=t(12181);function a(n){var e,t,r="";if("string"==typeof n||"number"==typeof n)r+=n;else if("object"==typeof n)if(Array.isArray(n))for(e=0;e<n.length;e++)n[e]&&(t=a(n[e]))&&(r&&(r+=" "),r+=t);else for(e in n)n[e]&&(r&&(r+=" "),r+=e);return r}var s=function(){for(var n,e,t=0,r="";t<arguments.length;)(n=arguments[t++])&&(e=a(n))&&(r&&(r+=" "),r+=e);return r};let u={data:""},c=n=>"object"==typeof window?((n?n.querySelector("#_goober"):window._goober)||Object.assign((n||document.head).appendChild(document.createElement("style")),{innerHTML:" ",id:"_goober"})).firstChild:n||u,l=/(?:([\u0080-\uFFFF\w-%@]+) *:? *([^{;]+?);|([^;}{]*?) *{)|(}\s*)/g,d=/\/\*[^]*?\*\/|  +/g,f=/\n+/g,p=(n,e)=>{let t="",r="",i="";for(let o in n){let a=n[o];"@"==o[0]?"i"==o[1]?t=o+" "+a+";":r+="f"==o[1]?p(a,o):o+"{"+p(a,"k"==o[1]?"":e)+"}":"object"==typeof a?r+=p(a,e?e.replace(/([^,])+/g,(n=>o.replace(/(^:.*)|([^,])+/g,(e=>/&/.test(e)?e.replace(/&/g,n):n?n+" "+e:e)))):o):null!=a&&(o=/^--/.test(o)?o:o.replace(/[A-Z]/g,"-$&").toLowerCase(),i+=p.p?p.p(o,a):o+":"+a+";")}return t+(e&&i?e+"{"+i+"}":i)+r},m={},h=n=>{if("object"==typeof n){let e="";for(let t in n)e+=t+h(n[t]);return e}return n},g=(n,e,t,r,i)=>{let o=h(n),a=m[o]||(m[o]=(n=>{let e=0,t=11;for(;e<n.length;)t=101*t+n.charCodeAt(e++)>>>0;return"go"+t})(o));if(!m[a]){let e=o!==n?n:(n=>{let e,t,r=[{}];for(;e=l.exec(n.replace(d,""));)e[4]?r.shift():e[3]?(t=e[3].replace(f," ").trim(),r.unshift(r[0][t]=r[0][t]||{})):r[0][e[1]]=e[2].replace(f," ").trim();return r[0]})(n);m[a]=p(i?{["@keyframes "+a]:e}:e,t?"":"."+a)}let s=t&&m.g?m.g:null;return t&&(m.g=m[a]),((n,e,t,r)=>{r?e.data=e.data.replace(r,n):-1===e.data.indexOf(n)&&(e.data=t?n+e.data:e.data+n)})(m[a],e,r,s),a},x=(n,e,t)=>n.reduce(((n,r,i)=>{let o=e[i];if(o&&o.call){let n=o(t),e=n&&n.props&&n.props.className||/^go/.test(n)&&n;o=e?"."+e:n&&"object"==typeof n?n.props?"":p(n,""):!1===n?"":n}return n+r+(null==o?"":o)}),"");function v(n){let e=this||{},t=n.call?n(e.p):n;return g(t.unshift?t.raw?x(t,[].slice.call(arguments,1),e.p):t.reduce(((n,t)=>Object.assign(n,t&&t.call?t(e.p):t)),{}):t,c(e.target),e.g,e.o,e.k)}function E(n,e){for(var t=0;t<e.length;t++){var r=e[t];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(n,r.key,r)}}function b(n,e,t){return e&&E(n.prototype,e),t&&E(n,t),n}function k(){return k=Object.assign||function(n){for(var e=1;e<arguments.length;e++){var t=arguments[e];for(var r in t)Object.prototype.hasOwnProperty.call(t,r)&&(n[r]=t[r])}return n},k.apply(this,arguments)}function y(n,e){n.prototype=Object.create(e.prototype),n.prototype.constructor=n,n.__proto__=e}function C(n,e){if(null==n)return{};var t,r,i={},o=Object.keys(n);for(r=0;r<o.length;r++)t=o[r],e.indexOf(t)>=0||(i[t]=n[t]);return i}v.bind({g:1}),v.bind({k:1});var w=function(){return""},S=i().createContext({enqueueSnackbar:w,closeSnackbar:w}),L="@media (max-width:599.95px)",O="@media (min-width:600px)",T=function(n){return n.charAt(0).toUpperCase()+n.slice(1)},D=function(n){return""+T(n.vertical)+T(n.horizontal)},j=function(n){return!!n||0===n},N="unmounted",H="exited",R="entering",M="entered",q="exiting",A=function(n){function e(e){var t;t=n.call(this,e)||this;var r,i=e.appear;return t.appearStatus=null,e.in?i?(r=H,t.appearStatus=R):r=M:r=e.unmountOnExit||e.mountOnEnter?N:H,t.state={status:r},t.nextCallback=null,t}y(e,n),e.getDerivedStateFromProps=function(n,e){return n.in&&e.status===N?{status:H}:null};var t=e.prototype;return t.componentDidMount=function(){this.updateStatus(!0,this.appearStatus)},t.componentDidUpdate=function(n){var e=null;if(n!==this.props){var t=this.state.status;this.props.in?t!==R&&t!==M&&(e=R):t!==R&&t!==M||(e=q)}this.updateStatus(!1,e)},t.componentWillUnmount=function(){this.cancelNextCallback()},t.getTimeouts=function(){var n=this.props.timeout,e=n,t=n;return null!=n&&"number"!=typeof n&&"string"!=typeof n&&(t=n.exit,e=n.enter),{exit:t,enter:e}},t.updateStatus=function(n,e){void 0===n&&(n=!1),null!==e?(this.cancelNextCallback(),e===R?this.performEnter(n):this.performExit()):this.props.unmountOnExit&&this.state.status===H&&this.setState({status:N})},t.performEnter=function(n){var e=this,t=this.props,r=t.enter,i=t.id,o=n,a=this.getTimeouts();n||r?(this.props.onEnter&&this.props.onEnter(this.node,o,i),this.safeSetState({status:R},(function(){e.props.onEntering&&e.props.onEntering(e.node,o,i),e.onTransitionEnd(a.enter,(function(){e.safeSetState({status:M},(function(){e.props.onEntered&&e.props.onEntered(e.node,o,i)}))}))}))):this.safeSetState({status:M},(function(){e.props.onEntered&&e.props.onEntered(e.node,o,i)}))},t.performExit=function(){var n=this,e=this.props,t=e.exit,r=e.id,i=this.getTimeouts();t?(this.props.onExit&&this.props.onExit(this.node,r),this.safeSetState({status:q},(function(){n.props.onExiting&&n.props.onExiting(n.node,r),n.onTransitionEnd(i.exit,(function(){n.safeSetState({status:H},(function(){n.props.onExited&&n.props.onExited(n.node,r)}))}))}))):this.safeSetState({status:H},(function(){n.props.onExited&&n.props.onExited(n.node,r)}))},t.cancelNextCallback=function(){null!==this.nextCallback&&this.nextCallback.cancel&&(this.nextCallback.cancel(),this.nextCallback=null)},t.safeSetState=function(n,e){e=this.setNextCallback(e),this.setState(n,e)},t.setNextCallback=function(n){var e=this,t=!0;return this.nextCallback=function(){t&&(t=!1,e.nextCallback=null,n())},this.nextCallback.cancel=function(){t=!1},this.nextCallback},t.onTransitionEnd=function(n,e){this.setNextCallback(e);var t=null==n&&!this.props.addEndListener;this.node&&!t?(this.props.addEndListener&&this.props.addEndListener(this.node,this.nextCallback),null!=n&&setTimeout(this.nextCallback,n)):setTimeout(this.nextCallback,0)},t.render=function(){var n=this.state.status;if(n===N)return null;var e=this.props;return(0,e.children)(n,C(e,["children","id","in","mountOnEnter","unmountOnExit","appear","enter","exit","timeout","addEndListener","onEnter","onEntering","onEntered","onExit","onExiting","onExited","nodeRef"]))},b(e,[{key:"node",get:function(){var n=this.props.nodeRef.current;if(!n)throw new Error("notistack - Custom snackbar is not refForwarding");return n}}]),e}(i().Component);function P(){}function V(n,e){"function"==typeof n?n(e):n&&(n.current=e)}function I(n,e){return(0,r.useMemo)((function(){return null==n&&null==e?null:function(t){V(n,t),V(e,t)}}),[n,e])}function W(n){var e=n.timeout,t=n.style,r=void 0===t?{}:t,i=n.mode;return{duration:"object"==typeof e?e[i]||0:e,easing:r.transitionTimingFunction,delay:r.transitionDelay}}A.defaultProps={in:!1,mountOnEnter:!1,unmountOnExit:!1,appear:!1,enter:!0,exit:!0,onEnter:P,onEntering:P,onEntered:P,onExit:P,onExiting:P,onExited:P};var z=function(n){n.scrollTop=n.scrollTop},F=function(n){return Math.round(n)+"ms"};function B(n,e){void 0===n&&(n=["all"]);var t=e||{},r=t.duration,i=void 0===r?300:r,o=t.easing,a=void 0===o?"cubic-bezier(0.4, 0, 0.2, 1)":o,s=t.delay,u=void 0===s?0:s;return(Array.isArray(n)?n:[n]).map((function(n){var e="string"==typeof i?i:F(i),t="string"==typeof u?u:F(u);return n+" "+e+" "+a+" "+t})).join(",")}function _(n){var e=function(n){return n&&n.ownerDocument||document}(n);return e.defaultView||window}function Z(n,e){if(e){var t=function(n,e){var t,r=e.getBoundingClientRect(),i=_(e);if(e.fakeTransform)t=e.fakeTransform;else{var o=i.getComputedStyle(e);t=o.getPropertyValue("-webkit-transform")||o.getPropertyValue("transform")}var a=0,s=0;if(t&&"none"!==t&&"string"==typeof t){var u=t.split("(")[1].split(")")[0].split(",");a=parseInt(u[4],10),s=parseInt(u[5],10)}switch(n){case"left":return"translateX("+(i.innerWidth+a-r.left)+"px)";case"right":return"translateX(-"+(r.left+r.width-a)+"px)";case"up":return"translateY("+(i.innerHeight+s-r.top)+"px)";default:return"translateY(-"+(r.top+r.height-s)+"px)"}}(n,e);t&&(e.style.webkitTransform=t,e.style.transform=t)}}var X=(0,r.forwardRef)((function(n,e){var t=n.children,i=n.direction,o=void 0===i?"down":i,a=n.in,s=n.style,u=n.timeout,c=void 0===u?0:u,l=n.onEnter,d=n.onEntered,f=n.onExit,p=n.onExited,m=C(n,["children","direction","in","style","timeout","onEnter","onEntered","onExit","onExited"]),h=(0,r.useRef)(null),g=I(t.ref,h),x=I(g,e),v=(0,r.useCallback)((function(){h.current&&Z(o,h.current)}),[o]);return(0,r.useEffect)((function(){if(!a&&"down"!==o&&"right"!==o){var n=function(n,e){var t;function r(){for(var r=this,i=arguments.length,o=new Array(i),a=0;a<i;a++)o[a]=arguments[a];var s=function(){n.apply(r,o)};clearTimeout(t),t=setTimeout(s,e)}return void 0===e&&(e=166),r.clear=function(){clearTimeout(t)},r}((function(){h.current&&Z(o,h.current)})),e=_(h.current);return e.addEventListener("resize",n),function(){n.clear(),e.removeEventListener("resize",n)}}}),[o,a]),(0,r.useEffect)((function(){a||v()}),[a,v]),(0,r.createElement)(A,Object.assign({appear:!0,nodeRef:h,onEnter:function(n,e,t){Z(o,n),z(n),l&&l(n,e,t)},onEntered:d,onEntering:function(n){var e=(null==s?void 0:s.transitionTimingFunction)||"cubic-bezier(0.0, 0, 0.2, 1)",t=W({timeout:c,mode:"enter",style:k({},s,{transitionTimingFunction:e})});n.style.webkitTransition=B("-webkit-transform",t),n.style.transition=B("transform",t),n.style.webkitTransform="none",n.style.transform="none"},onExit:function(n,e){var t=(null==s?void 0:s.transitionTimingFunction)||"cubic-bezier(0.4, 0, 0.6, 1)",r=W({timeout:c,mode:"exit",style:k({},s,{transitionTimingFunction:t})});n.style.webkitTransition=B("-webkit-transform",r),n.style.transition=B("transform",r),Z(o,n),f&&f(n,e)},onExited:function(n,e){n.style.webkitTransition="",n.style.transition="",p&&p(n,e)},in:a,timeout:c},m),(function(n,e){return(0,r.cloneElement)(t,k({ref:x,style:k({visibility:"exited"!==n||a?void 0:"hidden"},s,{},t.props.style)},e))}))}));X.displayName="Slide";var Q=function(n){return i().createElement("svg",Object.assign({viewBox:"0 0 24 24",focusable:"false",style:{fontSize:20,marginInlineEnd:8,userSelect:"none",width:"1em",height:"1em",display:"inline-block",fill:"currentColor",flexShrink:0}},n))},U=function(){return i().createElement(Q,null,i().createElement("path",{d:"M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M10 17L5 12L6.41\n        10.59L10 14.17L17.59 6.58L19 8L10 17Z"}))},G=function(){return i().createElement(Q,null,i().createElement("path",{d:"M13,14H11V10H13M13,18H11V16H13M1,21H23L12,2L1,21Z"}))},Y=function(){return i().createElement(Q,null,i().createElement("path",{d:"M12,2C17.53,2 22,6.47 22,12C22,17.53 17.53,22 12,22C6.47,22 2,17.53 2,12C2,\n        6.47 6.47,2 12,2M15.59,7L12,10.59L8.41,7L7,8.41L10.59,12L7,15.59L8.41,17L12,\n        13.41L15.59,17L17,15.59L13.41,12L17,8.41L15.59,7Z"}))},$=function(){return i().createElement(Q,null,i().createElement("path",{d:"M13,9H11V7H13M13,17H11V11H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,\n        0 22,12A10,10 0 0,0 12,2Z"}))},J={maxSnack:3,persist:!1,hideIconVariant:!1,disableWindowBlurListener:!1,variant:"default",autoHideDuration:5e3,iconVariant:{default:void 0,success:i().createElement(U,null),warning:i().createElement(G,null),error:i().createElement(Y,null),info:i().createElement($,null)},anchorOrigin:{vertical:"bottom",horizontal:"left"},TransitionComponent:X,transitionDuration:{enter:225,exit:195}};function K(n){return Object.entries(n).reduce((function(n,e){var t,r=e[0],i=e[1];return k({},n,((t={})[r]=v(i),t))}),{})}var nn="notistack-CollapseWrapper",en=K({root:{height:0},entered:{height:"auto"}}),tn="0px",rn=(0,r.forwardRef)((function(n,e){var t=n.children,i=n.in,o=n.onExited,a=n.id,u=(0,r.useRef)(null),c=(0,r.useRef)(null),l=I(e,c),d=function(){return u.current?u.current.clientHeight:0};return(0,r.createElement)(A,{id:a,in:i,unmountOnExit:!0,onEnter:function(n){n.style.height=tn},onEntered:function(n){n.style.height="auto"},onEntering:function(n){var e=d(),t=W({timeout:175,mode:"enter"}),r=t.duration,i=t.easing;n.style.transitionDuration="string"==typeof r?r:r+"ms",n.style.height=e+"px",n.style.transitionTimingFunction=i||""},onExit:function(n){n.style.height=d()+"px"},onExited:o,onExiting:function(n){z(n);var e=W({timeout:175,mode:"exit"}),t=e.duration,r=e.easing;n.style.transitionDuration="string"==typeof t?t:t+"ms",n.style.height=tn,n.style.transitionTimingFunction=r||""},nodeRef:c,timeout:175},(function(n,e){return(0,r.createElement)("div",Object.assign({ref:l,className:s(en.root,"entered"===n&&en.entered),style:k({pointerEvents:"all",overflow:"hidden",minHeight:tn,transition:B("height")},"entered"===n&&{overflow:"visible"},{},"exited"===n&&!i&&{visibility:"hidden"})},e),(0,r.createElement)("div",{ref:u,className:nn,style:{display:"flex",width:"100%"}},t))}))}));rn.displayName="Collapse";var on={right:"left",left:"right",bottom:"up",top:"down"},an=function(n){return"anchorOrigin"+D(n)};function sn(){for(var n=arguments.length,e=new Array(n),t=0;t<n;t++)e[t]=arguments[t];return e.reduce((function(n,e){return null==e?n:function(){for(var t=arguments.length,r=new Array(t),i=0;i<t;i++)r[i]=arguments[i];n.apply(this,r),e.apply(this,r)}}),(function(){}))}var un="undefined"!=typeof window?r.useLayoutEffect:r.useEffect;function cn(n){var e=(0,r.useRef)(n);return un((function(){e.current=n})),(0,r.useCallback)((function(){return e.current.apply(void 0,arguments)}),[])}var ln,dn=(0,r.forwardRef)((function(n,e){var t=n.children,i=n.className,o=n.autoHideDuration,a=n.disableWindowBlurListener,u=void 0!==a&&a,c=n.onClose,l=n.id,d=n.open,f=n.SnackbarProps,p=void 0===f?{}:f,m=(0,r.useRef)(),h=cn((function(){c&&c.apply(void 0,arguments)})),g=cn((function(n){c&&null!=n&&(m.current&&clearTimeout(m.current),m.current=setTimeout((function(){h(null,"timeout",l)}),n))}));(0,r.useEffect)((function(){return d&&g(o),function(){m.current&&clearTimeout(m.current)}}),[d,o,g]);var x=function(){m.current&&clearTimeout(m.current)},v=(0,r.useCallback)((function(){null!=o&&g(.5*o)}),[o,g]);return(0,r.useEffect)((function(){if(!u&&d)return window.addEventListener("focus",v),window.addEventListener("blur",x),function(){window.removeEventListener("focus",v),window.removeEventListener("blur",x)}}),[u,v,d]),(0,r.createElement)("div",Object.assign({ref:e},p,{className:s("notistack-Snackbar",i),onMouseEnter:function(n){p.onMouseEnter&&p.onMouseEnter(n),x()},onMouseLeave:function(n){p.onMouseLeave&&p.onMouseLeave(n),v()}}),t)}));dn.displayName="Snackbar";var fn=K({root:(ln={display:"flex",flexWrap:"wrap",flexGrow:1},ln[O]={flexGrow:"initial",minWidth:"288px"},ln)}),pn=(0,r.forwardRef)((function(n,e){var t=n.className,r=C(n,["className"]);return i().createElement("div",Object.assign({ref:e,className:s(fn.root,t)},r))}));pn.displayName="SnackbarContent";var mn=K({root:{backgroundColor:"#313131",fontSize:"0.875rem",lineHeight:1.43,letterSpacing:"0.01071em",color:"#fff",alignItems:"center",padding:"6px 16px",borderRadius:"4px",boxShadow:"0px 3px 5px -1px rgba(0,0,0,0.2),0px 6px 10px 0px rgba(0,0,0,0.14),0px 1px 18px 0px rgba(0,0,0,0.12)"},lessPadding:{paddingLeft:"20px"},default:{backgroundColor:"#313131"},success:{backgroundColor:"#43a047"},error:{backgroundColor:"#d32f2f"},warning:{backgroundColor:"#ff9800"},info:{backgroundColor:"#2196f3"},message:{display:"flex",alignItems:"center",padding:"8px 0"},action:{display:"flex",alignItems:"center",marginLeft:"auto",paddingLeft:"16px",marginRight:"-8px"}}),hn=(0,r.forwardRef)((function(n,e){var t=n.id,r=n.message,o=n.action,a=n.iconVariant,u=n.variant,c=n.hideIconVariant,l=n.style,d=a[u],f=o;return"function"==typeof f&&(f=f(t)),i().createElement(pn,{ref:e,role:"alert",style:l,className:s("notistack-MuiContent",mn.root,mn[u],!c&&d&&mn.lessPadding)},i().createElement("div",{id:"notistack-snackbar",className:mn.message},c?null:d,r),f&&i().createElement("div",{className:mn.action},f))}));hn.displayName="MaterialDesignContent";var gn,xn,vn,En,bn,kn,yn,Cn=(0,r.memo)(hn),wn=K({wrappedRoot:{width:"100%",position:"relative",transform:"translateX(0)",top:0,right:0,bottom:0,left:0,minWidth:"288px"}}),Sn=function(n){var e=(0,r.useRef)(),t=(0,r.useState)(!0),o=t[0],a=t[1],u=sn(n.snack.onClose,n.onClose),c=(0,r.useCallback)((function(){e.current=setTimeout((function(){a((function(n){return!n}))}),125)}),[]);(0,r.useEffect)((function(){return function(){e.current&&clearTimeout(e.current)}}),[]);var l,d=n.snack,f=n.classes,p=n.Component,m=void 0===p?Cn:p,h=(0,r.useMemo)((function(){return function(n){void 0===n&&(n={});var e={containerRoot:!0,containerAnchorOriginTopCenter:!0,containerAnchorOriginBottomCenter:!0,containerAnchorOriginTopRight:!0,containerAnchorOriginBottomRight:!0,containerAnchorOriginTopLeft:!0,containerAnchorOriginBottomLeft:!0};return Object.keys(n).filter((function(n){return!e[n]})).reduce((function(e,t){var r;return k({},e,((r={})[t]=n[t],r))}),{})}(f)}),[f]),g=d.open,x=d.SnackbarProps,v=d.TransitionComponent,E=d.TransitionProps,b=d.transitionDuration,y=d.disableWindowBlurListener,w=d.content,S=C(d,["open","SnackbarProps","TransitionComponent","TransitionProps","transitionDuration","disableWindowBlurListener","content","entered","requestClose","onEnter","onEntered","onExit","onExited"]),L=k({direction:(l=S.anchorOrigin,"center"!==l.horizontal?on[l.horizontal]:on[l.vertical]),timeout:b},E),O=w;"function"==typeof O&&(O=O(S.id,S.message));var T=["onEnter","onEntered","onExit","onExited"].reduce((function(e,t){var r;return k({},e,((r={})[t]=sn(n.snack[t],n[t]),r))}),{});return i().createElement(rn,{id:S.id,in:o,onExited:T.onExited},i().createElement(dn,{open:g,id:S.id,disableWindowBlurListener:y,autoHideDuration:S.autoHideDuration,className:s(wn.wrappedRoot,h.root,h[an(S.anchorOrigin)]),SnackbarProps:x,onClose:u},i().createElement(v,Object.assign({},L,{id:S.id,in:g,onExit:T.onExit,onExited:c,onEnter:T.onEnter,onEntered:sn(T.onEntered,(function(){n.snack.requestClose&&u(null,"instructed",n.snack.id)}))}),O||i().createElement(m,Object.assign({},S)))))},Ln=20,On=6,Tn=2,Dn=".notistack-CollapseWrapper",jn=K({root:(gn={boxSizing:"border-box",display:"flex",maxHeight:"100%",position:"fixed",zIndex:1400,height:"auto",width:"auto",transition:B(["top","right","bottom","left","max-width"],{duration:300,easing:"ease"}),pointerEvents:"none"},gn[Dn]={padding:On+"px 0px",transition:"padding 300ms ease 0ms"},gn.maxWidth="calc(100% - "+2*Ln+"px)",gn[L]={width:"100%",maxWidth:"calc(100% - 32px)"},gn),rootDense:(xn={},xn[Dn]={padding:Tn+"px 0px"},xn),top:{top:Ln-On+"px",flexDirection:"column"},bottom:{bottom:Ln-On+"px",flexDirection:"column-reverse"},left:(vn={left:Ln+"px"},vn[O]={alignItems:"flex-start"},vn[L]={left:"16px"},vn),right:(En={right:Ln+"px"},En[O]={alignItems:"flex-end"},En[L]={right:"16px"},En),center:(bn={left:"50%",transform:"translateX(-50%)"},bn[O]={alignItems:"center"},bn)}),Nn=function(n){var e=n.classes,t=void 0===e?{}:e,r=n.anchorOrigin,o=n.dense,a=n.children,u=s("notistack-SnackbarContainer",jn[r.vertical],jn[r.horizontal],jn.root,t.containerRoot,t["containerAnchorOrigin"+D(r)],o&&jn.rootDense);return i().createElement("div",{className:u},a)},Hn=(0,r.memo)(Nn),Rn=function(n){return"string"!=typeof n},Mn=function(n){function e(e){var t;return(t=n.call(this,e)||this).enqueueSnackbar=function(n,e){void 0===e&&(e={});var r=Rn(n)?n:e,i=n;Rn(n)&&(i=n.message);var o=r.key,a=r.preventDuplicate,u=C(r,["key","preventDuplicate"]),c=j(o),l=c?o:(new Date).getTime()+Math.random(),d=function(n,e){return function(t,r){return void 0===r&&(r=!1),r?k({},J[t],{},e[t],{},n[t]):"autoHideDuration"===t?(i=n.autoHideDuration,o=e.autoHideDuration,(a=function(n){return"number"==typeof n||null===n})(i)?i:a(o)?o:J.autoHideDuration):"transitionDuration"===t?function(n,e){var t=function(n,e){return e.some((function(e){return typeof n===e}))};return t(n,["string","number"])?n:t(n,["object"])?k({},J.transitionDuration,{},t(e,["object"])&&e,{},n):t(e,["string","number"])?e:t(e,["object"])?k({},J.transitionDuration,{},e):J.transitionDuration}(n.transitionDuration,e.transitionDuration):n[t]||e[t]||J[t];var i,o,a}}(u,t.props),f=k({id:l},u,{message:i,open:!0,entered:!1,requestClose:!1,persist:d("persist"),action:d("action"),content:d("content"),variant:d("variant"),anchorOrigin:d("anchorOrigin"),disableWindowBlurListener:d("disableWindowBlurListener"),autoHideDuration:d("autoHideDuration"),hideIconVariant:d("hideIconVariant"),TransitionComponent:d("TransitionComponent"),transitionDuration:d("transitionDuration"),TransitionProps:d("TransitionProps",!0),iconVariant:d("iconVariant",!0),style:d("style",!0),SnackbarProps:d("SnackbarProps",!0),className:s(t.props.className,u.className)});return f.persist&&(f.autoHideDuration=void 0),t.setState((function(n){if(void 0===a&&t.props.preventDuplicate||a){var e=function(n){return c?n.id===l:n.message===i},r=n.queue.findIndex(e)>-1,o=n.snacks.findIndex(e)>-1;if(r||o)return n}return t.handleDisplaySnack(k({},n,{queue:[].concat(n.queue,[f])}))})),l},t.handleDisplaySnack=function(n){return n.snacks.length>=t.maxSnack?t.handleDismissOldest(n):t.processQueue(n)},t.processQueue=function(n){var e=n.queue,t=n.snacks;return e.length>0?k({},n,{snacks:[].concat(t,[e[0]]),queue:e.slice(1,e.length)}):n},t.handleDismissOldest=function(n){if(n.snacks.some((function(n){return!n.open||n.requestClose})))return n;var e=!1,r=!1;n.snacks.reduce((function(n,e){return n+(e.open&&e.persist?1:0)}),0)===t.maxSnack&&(r=!0);var i=n.snacks.map((function(n){return e||n.persist&&!r?k({},n):(e=!0,n.entered?(n.onClose&&n.onClose(null,"maxsnack",n.id),t.props.onClose&&t.props.onClose(null,"maxsnack",n.id),k({},n,{open:!1})):k({},n,{requestClose:!0}))}));return k({},n,{snacks:i})},t.handleEnteredSnack=function(n,e,r){if(!j(r))throw new Error("handleEnteredSnack Cannot be called with undefined key");t.setState((function(n){return{snacks:n.snacks.map((function(n){return n.id===r?k({},n,{entered:!0}):k({},n)}))}}))},t.handleCloseSnack=function(n,e,r){t.props.onClose&&t.props.onClose(n,e,r);var i=void 0===r;t.setState((function(n){var e=n.snacks,t=n.queue;return{snacks:e.map((function(n){return i||n.id===r?n.entered?k({},n,{open:!1}):k({},n,{requestClose:!0}):k({},n)})),queue:t.filter((function(n){return n.id!==r}))}}))},t.closeSnackbar=function(n){var e=t.state.snacks.find((function(e){return e.id===n}));j(n)&&e&&e.onClose&&e.onClose(null,"instructed",n),t.handleCloseSnack(null,"instructed",n)},t.handleExitedSnack=function(n,e){if(!j(e))throw new Error("handleExitedSnack Cannot be called with undefined key");t.setState((function(n){var r=t.processQueue(k({},n,{snacks:n.snacks.filter((function(n){return n.id!==e}))}));return 0===r.queue.length?r:t.handleDismissOldest(r)}))},kn=t.enqueueSnackbar,yn=t.closeSnackbar,t.state={snacks:[],queue:[],contextValue:{enqueueSnackbar:t.enqueueSnackbar,closeSnackbar:t.closeSnackbar}},t}return y(e,n),e.prototype.render=function(){var n=this,e=this.state.contextValue,t=this.props,r=t.domRoot,a=t.children,s=t.dense,u=void 0!==s&&s,c=t.Components,l=void 0===c?{}:c,d=t.classes,f=this.state.snacks.reduce((function(n,e){var t,r=D(e.anchorOrigin),i=n[r]||[];return k({},n,((t={})[r]=[].concat(i,[e]),t))}),{}),p=Object.keys(f).map((function(e){var t=f[e],r=t[0];return i().createElement(Hn,{key:e,dense:u,anchorOrigin:r.anchorOrigin,classes:d},t.map((function(e){return i().createElement(Sn,{key:e.id,snack:e,classes:d,Component:l[e.variant],onClose:n.handleCloseSnack,onEnter:n.props.onEnter,onExit:n.props.onExit,onExited:sn(n.handleExitedSnack,n.props.onExited),onEntered:sn(n.handleEnteredSnack,n.props.onEntered)})})))}));return i().createElement(S.Provider,{value:e},a,r?(0,o.createPortal)(p,r):p)},b(e,[{key:"maxSnack",get:function(){return this.props.maxSnack||J.maxSnack}}]),e}(r.Component),qn=function(){return(0,r.useContext)(S)}}}]);